<?php

namespace Database\Seeders;

use App\Models\ProductAttibute;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductAttributeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ProductAttibute::create([
            "title"      =>  "Color",
            "parent_id"  => 0
        ]);

        ProductAttibute::create([
            "title"      =>  "Blue",
            "parent_id"  => 1
        ]);

        ProductAttibute::create([
            "title"      =>  "Black",
            "parent_id"  => 1
        ]);

        ProductAttibute::create([
            "title"      =>  "Green",
            "parent_id"  => 1
        ]);

        ProductAttibute::create([
            "title"      =>  "Size",
            "parent_id"  => 0
        ]);

        ProductAttibute::create([
            "title"      =>  "Small",
            "parent_id"  => 5
        ]);

        ProductAttibute::create([
            "title"      =>  "Medium",
            "parent_id"  => 5
        ]);

        ProductAttibute::create([
            "title"      =>  "Large",
            "parent_id"  => 5
        ]);
    }
}
