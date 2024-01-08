<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
        select.js-example-basic-multiple {
            width: 610px !important;
            height: 100%;
        }
    </style>
</head>

<body>
    <div class="container">

        @if(session('success'))
        <div class="row my-4">
            <div class="col-md-12">
                <h3 style="color: rgb(17, 187, 68)">{{ session('success') }}</h3>
            </div>
        </div>
        @endif

        @if(session('error'))
        <div class="row my-4">
            <div class="col-md-12">
                <h6 style="color: red;">{{ session('error') }}</h6>
            </div>
        </div>
        @endif

        <div class="row">
            <div class="col-md-12">
                <div class="card my-4">
                    <div class="card-header">
                        <h3>Product Add</h3>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('product.store') }}" method="POST">
                            @csrf
                            <fieldset>
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label for="exampleFormControlInput1" class="form-label">Title</label>
                                        <input type="text" name="title" id="productTitle" class="form-control"
                                            id="exampleFormControlInput1">
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label for="exampleFormControlInput2" class="form-label">Category</label>
                                        <select name="category_id" class="form-select"
                                            aria-label="Default select example" id="exampleFormControlInput2">
                                            <option selected>Open this select menu</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label for="exampleFormControlInput3" class="form-label">Sku</label>
                                        <input type="text" name="sku" class="form-control"
                                            id="exampleFormControlInput3">
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label for="exampleFormControlInput4" class="form-label">Unit</label>
                                        <input type="text" name="sku" class="form-control"
                                            id="exampleFormControlInput4">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="barcodeVal" class="form-label">Barcode</label>
                                                <input type="text" name="barcode" class="form-control" id="barcodeVal">
                                            </div>
                                            <div class="col-md-6">
                                                <button type="button" class="btn btn-primary generateBarcode"
                                                    style="margin-top: 31px">Generate Barcode</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Preview</label>
                                        <div>
                                            <div id="barcodeShow">
                                                <img src="{{ asset('assets/barcode/code.jpg') }}" width="300px" height="50px" alt="barcode"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <input type="checkbox" name="add_varient" class="custom-checkbox"
                                            id="checkboxEvent">
                                        <label for="checkboxEvent" class="form-label">Add Variation</label>
                                    </div>
                                </div>

                                <div class="row" id="rowToToggle" style="display:none;">
                                    <div class="mb-3 col-md-6">
                                        <label for="attribute" class="form-label">Attribute</label>
                                        <div>
                                            <select class="js-example-basic-multiple" id="attribute"
                                                multiple="multiple">
                                                @foreach ($attributes as $attribute)
                                                <option value="{{ $attribute->id }}" data-id="{{ $attribute->id }}">
                                                    {{ $attribute->title }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <label for="attributeValue" class="form-label">Attribute Values</label>
                                        <div>
                                            <select class="js-example-basic-multiple" id="attributeValue"
                                                multiple="multiple">

                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div id="attributeToToggle" style="display:none;">

                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <label for="checkboxEvent" class="form-label">Description</label>
                                        <textarea class="form-control" name="content" rows="5"></textarea>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
            $('#checkboxEvent').on('change', function() {
                if ($(this).is(':checked')) {
                    $('#rowToToggle').show();
                } else {
                    $('#rowToToggle').hide();
                }
            });
            $("#attribute").change(function() {
                var selectedIds = [];
                $(this).find(":selected").each(function() {
                    var selectedId = $(this).data("id");
                    selectedIds.push(selectedId);
                });
                var url = "{{ route('product.attribute.value') }}";
                $.ajax({
                    type: "GET",
                    url: url,
                    data: {
                        ids: selectedIds
                    },
                    success: function(res) {
                        var attributeValue = $("#attributeValue");
                        attributeValue.empty();
                        for (var i = 0; i < res.data.length; i++) {
                            attributeValue.append('<option value="' + res.data[i].id +
                                '" data-id="' + res.data[i].id + '">' + res.data[i]
                                .title + '</option>');
                        }
                    }
                })
            });
            $("#attributeValue").change(function() {
                var selectedIds = [];
                var productTitle = $("#productTitle").val();
                $("#attribute").find(":selected").each(function() {
                    var selectedId = $(this).data("id");
                    selectedIds.push(selectedId);
                });
                var selectedValueIds = [];
                $(this).find(":selected").each(function() {
                    var selectedValueId = $(this).data('id');
                    selectedValueIds.push(selectedValueId);
                });
                var url = "{{ route('product.attribute.value.form') }}";
                $.ajax({
                    type: "GET",
                    url: url,
                    data: {
                        ids: selectedIds,
                        valueIds: selectedValueIds,
                        productTitle: productTitle,
                    },
                    success: function(res) {
                        if (res.status === true && res.data !== undefined && res.data !==
                            null) {
                            attributes_option(res.data);
                        } else {
                            console.log(res.message);
                        }
                    }
                })
            })

            function attributes_option(values) {
                var option_attrs = '';
                for (var i = 0; i < values.length; i++) {
                    option_attrs += `
                                <div class="row mb-3">
                                    <div class="col-md-2">
                                        <input type="text" class="form-control" name="var_title[]" value="${values[i].title}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" class="form-control" name="var_val[]" value="${values[i].val}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" class="form-control" name="var_sku[]" value="${values[i].sku}">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" class="form-control" name="var_unit[]" value="" placeholder="e.g kg, liter">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" class="form-control barcodeVar" name="var_barcode[]" value="" placeholder="e.g barcode">
                                    </div>
                                    <div class="col-md-2">
                                        <button type="button" class="btn btn-primary generateBarcodeVar">Generate</button>
                                    </div>
                                </div>
                            `;
                }
                $("#attributeToToggle").show();
                $("#attributeToToggle").html(option_attrs);
                $(".generateBarcodeVar").click(function() {
                    var url = "{{ route('generate-barcode') }}";
                    var barcodeVarInput = $(this).closest('.row').find('.barcodeVar');
                    $.ajax({
                        type: "GET",
                        url: url,
                        success: function(res) {
                            if (res.status == true) {
                                barcodeVarInput.val(res.code);
                            }
                        }
                    });
                });
            }
            $(".generateBarcode").click(function() {
                var url = "{{ route('generate-barcode') }}";
                $("#barcodeShow").empty();
                $.ajax({
                    type: "GET",
                    url: url,
                    success: function(res) {
                        if (res.status == true) {
                            $("#barcodeShow").html(res.barcode);
                            $("#barcodeVal").val(res.code);
                        }
                    }
                })
            })
        });
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
    </script>
</body>

</html>
