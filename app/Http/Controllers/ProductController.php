<?php

namespace App\Http\Controllers;

use Exception;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\ProductAttibute;
use Illuminate\Support\Facades\Validator;
use Milon\Barcode\DNS1D;

class ProductController extends Controller
{
    public function create()
    {

        $attributes = ProductAttibute::where('parent_id', 0)->get();

        return view('welcome', [
            'attributes' => $attributes
        ]);
    }

    public function attributeValue(Request $request)
    {
        try {

            $attribute_values = ProductAttibute::whereIn('parent_id', $request->ids)->get();

            return response()->json([
                'status'  => true,
                'message' => 'Retrieved successfully',
                'data'    =>  $attribute_values
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'  => false,
                'message' => 'Something went wrong'
            ]);
        }
    }


    public function attributeValueForm(Request $request)
    {
        try {
            $attribute_form = [];
            $current_form = [];
            $attribute_id = current($request->ids);
            $current_ids_count = 0;
            $current_ids = [];

            foreach ($request->valueIds as $valueId) {
                $attribute = ProductAttibute::where('id', $valueId)->where('parent_id', $attribute_id)->first();

                if ($attribute) {
                    $current_ids_count++;
                    $current_ids[] = $attribute->id;
                    $current_form[] = [
                        'id'    => $attribute->id,
                        'title' => $attribute->title,
                        'val'   => $attribute->title,
                        'sku'   => Str::lower($request->productTitle) . "-" . Str::lower($attribute->title),
                    ];

                    $attribute_form[] = [
                        'id'    => $attribute->id,
                        'title' => $attribute->title,
                        'val'   => $attribute->title,
                        'sku'   => Str::lower($request->productTitle) . '-' . Str::lower($attribute->title),
                    ];
                }
            }

            $all_attr_values = ProductAttibute::whereIn('id', $request->valueIds)
                ->whereNotIn('id', $current_ids)
                ->get();

            $val_ids = [];

            foreach ($all_attr_values as $val) {
                $val_ids[] = $val->id;
            }

            for ($i = 0; $i < $current_ids_count; $i++) {
                foreach ($val_ids as $id) {
                    $attr_option = ProductAttibute::find($id);
                    if ($attr_option) {

                        $sku_gen = Str::lower($request->productTitle) . '-' . Str::lower($current_form[$i]['title']) . '-' . Str::lower($attr_option->title);

                        $ex_product = Product::where('slug', $sku_gen)->first();

                        if ($ex_product) {
                            $attribute_form[] = [
                                'id'    => $attr_option->id,
                                'title' => $current_form[$i]['title'],
                                'val'   => $attr_option->title,
                                'sku'   => $sku_gen . '-' . 1,
                            ];
                        } else {
                            $attribute_form[] = [
                                'id'    => $attr_option->id,
                                'title' => $current_form[$i]['title'],
                                'val'   => $attr_option->title,
                                'sku'   => $sku_gen,
                            ];
                        }
                    }
                }
            }

            return response()->json([
                'status'  => true,
                'data'    => $attribute_form,
                'message' => 'Attribute values retrieved successfully',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'  => false,
                'message' => 'Something went wrong',
            ]);
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            "title" => "required|string",
        ]);

        if ($validator->fails()) {
            return back()->with(['error' => $validator->errors()->first()]);
        }

        if ($request->add_varient == 'on') {

            //return $content;

            for ($i = 0; $i < count($request->var_sku); $i++) {
                $product = new Product();
                $product->title = $request->title;
                $product->slug  = $request->var_sku[$i];
                $product->category_id  = $request->category_id;
                $product->unit  = $request->var_unit[$i];
                $product->sku  = $request->var_sku[$i];
                $product->barcode  = $request->var_barcode[$i];
                $product->content  = $request->content;
                $product->status  = 'Active';

                $product->save();
            }
        } else {
            $product = new Product();
            $product->title = $request->title;
            $product->slug  = $request->title;
            $product->category_id  = $request->category_id;
            $product->unit  = $request->unit;
            $product->sku  = $request->sku;
            $product->barcode  = $request->barcode;
            $product->content  = $request->content;
            $product->status  = 'Active';
            $product->save();
        }

        return back()->with(['success' => "Product add success"]);
    }

    public function generateBarcode()
    {
        $code = rand(10000000, 99999999); // Adjust the range as needed
        $barcode = new DNS1D();
        $gen = $barcode->getBarcodeHTML($code, 'C39');

        return response()->json([
            'status'  => true,
            'code'    => $code,
            'barcode' => $gen
        ]);
    }
}
