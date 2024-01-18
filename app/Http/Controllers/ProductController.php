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
            $attribute_id = $request->ids[0];
            $next_attribute_id = $request->ids[1] ?? null;
            $blade_attribute_id = $request->ids[2] ?? null;
            $current_ids_count = 0;
            $current_ids = [];

            $next_attributes_count = 0;
            $next_ids = [];
            $blade_attributes_counts = 0;
            $blade_ids = [];

            foreach ($request->valueIds as $valueId) {
                if ($blade_attribute_id !== null) {
                    $blade_attributes_counts++;
                    $blade_attribute = ProductAttibute::where('id', $valueId)
                        ->where('parent_id', $blade_attribute_id)
                        ->first();

                    if ($blade_attribute) {
                        $blade_ids[] = $blade_attribute->id;
                    }
                }

                if ($next_attribute_id !== null) {
                    $next_attribute = ProductAttibute::where('id', $valueId)
                        ->where('parent_id', $next_attribute_id)
                        ->first();

                    if ($next_attribute) {
                        $next_attributes_count++;
                        $next_ids[] = $next_attribute->id;

                    }
                }

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

                }
            }

            $all_attr_values = ProductAttibute::whereIn('id', $request->valueIds)
                ->whereNotIn('id', $current_ids)
                ->get();

            $val_ids = [];

            foreach ($all_attr_values as $val) {
                $val_ids[] = $val->id;
            }


            foreach ($current_ids as $i => $current_id) {
                 $firstElement = ProductAttibute::where('id', $current_id)->first();

//                 $attribute_form[] = [
//                     'id'    => $firstElement->id,
//                     'title' => $firstElement->title,
//                     'val'   => $firstElement->title,
//                     'sku'   => Str::lower($request->productTitle) . '-' . Str::lower($firstElement->title),
//                 ];

                foreach ($next_ids as $key => $next_id) {

                    if (count($blade_ids) > 0) {
                        foreach ($blade_ids as $key => $blade_id) {
                            $attr_option = ProductAttibute::where('id', $next_id)->first();
                            $blade_option = ProductAttibute::where('id', $blade_id)->first();

                            if ($attr_option && $blade_option) {
                                $sku_gen = Str::lower($request->productTitle) . '-' . Str::lower($current_form[$i]['title']) . '-' . Str::lower($attr_option->title) . '-' . Str::lower($blade_option->title);
                                $ex_product = Product::where('slug', $sku_gen)->first();

                                if ($ex_product) {
                                    $suffix = 1;
                                    do {
                                        $ex_product = Product::where('slug', $sku_gen)->first();
                                        $suffix++;
                                    } while ($ex_product);
                                }

                                $attribute_form[] = [
                                    'id'    => $attr_option->id,
                                    'title' => $current_form[$i]['title'],
                                    'val'   => $attr_option->title,
                                    'sku'   => $sku_gen,
                                ];
                            }
                        }
                    }else{
                        $attr_option = ProductAttibute::where('id', $next_id)->first();

                        if ($attr_option) {
                            $sku_gen = Str::lower($request->productTitle) . '-' . Str::lower($current_form[$i]['title']) . '-' . Str::lower($attr_option->title);
                            $ex_product = Product::where('slug', $sku_gen)->first();

                            if ($ex_product) {
                                $suffix = 1;
                                do {
                                    $ex_product = Product::where('slug', $sku_gen)->first();
                                    $suffix++;
                                } while ($ex_product);
                            }

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
                'data'    => $attribute_form ?? $current_form,
                'message' => 'Attribute values retrieved successfully',
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status'  => false,
                'message' => $e->getMessage(),
            ]);
        }
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
