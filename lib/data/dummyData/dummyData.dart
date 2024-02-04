import 'package:flutter/material.dart';
import 'package:ymk_store/features/shop/models/bannerModel.dart';
import 'package:ymk_store/features/shop/models/brandModel.dart';
import 'package:ymk_store/features/shop/models/categoryModel.dart';
import 'package:ymk_store/features/shop/models/productAttributeModel.dart';
import 'package:ymk_store/features/shop/models/productCategoryModel.dart';
import 'package:ymk_store/features/shop/models/productVariationModel.dart';
import 'package:ymk_store/utils/constants/assetImage.dart';
import 'package:ymk_store/utils/constants/txtContents.dart';

import '../../features/shop/models/brandCategoryModel.dart';
import '../../features/shop/models/productModel.dart';

class dummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        name: 'Mobile',
        image: assetImage.productMiPhone,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Accessories',
        image: assetImage.categoryAccessoires,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'Audio',
        image: assetImage.productEarbuds,
        isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'Appliances',
        image: assetImage.productOven,
        isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Displays',
        image: assetImage.categoryDisplay1,
        isFeatured: true),

    //subCategoires
    CategoryModel(
        id: '6',
        name: 'Smartphones',
        image: assetImage.subCategorySmartPhones,
        isFeatured: false,
        parentId: '1'),
    CategoryModel(
        id: '7',
        name: 'Tablets',
        image: assetImage.subCategoryTablets,
        isFeatured: false,
        parentId: '1'),
  ];

  static final List<BannerModel> banners = [
    BannerModel(
        id: '1',
        active: true,
        imgUrl: assetImage.carouselImg2,
        targetScreen: ""),
    BannerModel(
        id: '2',
        active: true,
        imgUrl: assetImage.carouselImg4,
        targetScreen: ""),
    BannerModel(
        id: '3',
        active: true,
        imgUrl: assetImage.carouselImg1,
        targetScreen: ""),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: assetImage.brandIOS,
        isFeatured: true,
        name: TxtContents.brandIOS,
        productCount: 230),
    BrandModel(
        id: '2',
        image: assetImage.brandMi,
        isFeatured: true,
        name: TxtContents.brandMi,
        productCount: 30),
    BrandModel(
        id: '3',
        image: assetImage.brandSamsung,
        isFeatured: true,
        name: TxtContents.brandSamsung,
        productCount: 50),
    BrandModel(
        id: '4',
        image: assetImage.brandRemax,
        isFeatured: true,
        name: TxtContents.brandRemax,
        productCount: 73),
    BrandModel(
      id: '5',
      image: assetImage.brandVivo,
      isFeatured: false,
      name: TxtContents.brandVivo,
      productCount: 50,
    ),
    BrandModel(
      id: '6',
      image: assetImage.brandOppo,
      isFeatured: false,
      name: TxtContents.brandOppo,
      productCount: 65,
    ),
    BrandModel(
      id: '7',
      image: assetImage.brandInfinix,
      isFeatured: false,
      name: TxtContents.brandInfinix,
      productCount: 30,
    ),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '001',
        title: TxtContents.product001,
        price: 1419.99,
        stock: 20,
        thumbnail: assetImage.product001,
        productType: 'ProductType.variable',
        sku: 'SAM001',
        brand: BrandModel(
            id: '3',
            image: assetImage.brandSamsung,
            isFeatured: true,
            name: TxtContents.brandSamsung,
            productCount: 50),
        images: [
          assetImage.product001_1,
          assetImage.product001_2,
          assetImage.product001_3
        ],
        salePrice: 549.99,
        isFeatured: true,
        categoryId: '1',
        description: TxtContents.productDesc001,
        productAttributes: [
          ProductAttributeModel(name: 'Color', values: [
            'Titanium Green',
            'Titanium Blue',
            'Titanium Orange',
            'Titanium Violet',
            'Titanium Yellow',
            'Titanium Black',
            'Titanium Gray'
          ]),
          ProductAttributeModel(
              name: 'Storage', values: ['256GB', '512GB', '1TB']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              sku: 'SAM001',
              stock: 10,
              price: 1419.99,
              salePrice: 549.99,
              attributeValues: {
                'Storage': '512GB',
                'Color': 'Titanium Orange'
              }),
          ProductVariationModel(
              id: '2',
              sku: 'SAM001',
              stock: 5,
              price: 1659.99,
              salePrice: 669.99,
              attributeValues: {'Storage': '1TB', 'Color': 'Titanium Blue'}),
        ],
        date: DateTime.now()),

    //product IOs
    ProductModel(
      id: '002',
      title: TxtContents.product002,
      price: 1599.99,
      stock: 15,
      thumbnail: assetImage.product002_1,
      productType: 'ProductType.variable',
      sku: 'IOS15Pro',
      brand: BrandModel(
        id: '1',
        image: assetImage.brandIOS,
        isFeatured: true,
        name: TxtContents.brandIOS,
        productCount: 60,
      ),
      images: [
        assetImage.product002,
      ],
      salePrice: 1300,
      isFeatured: true,
      categoryId: '1',
      description: TxtContents.productDesc002,
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: [
            'Natural Titanium',
            'Black Titanium',
            'White Titanium',
            'Blue Titanium',
          ],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['128GB', '256GB', '512GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          sku: 'IOS15Pro',
          stock: 12,
          price: 1599.99,
          salePrice: 599.99,
          attributeValues: {'Storage': '256GB', 'Color': 'Blue Titanium'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'IOS15Pro',
          stock: 3,
          price: 1799.99,
          salePrice: 699.99,
          attributeValues: {'Storage': '512GB', 'Color': 'White Titanium'},
        ),
      ],
      date: DateTime.now(),
    ),

    ProductModel(
        id: '003',
        title: 'Samsung Galaxy Buds',
        price: 129.99,
        stock: 25,
        thumbnail: assetImage.product003,
        productType: 'ProductType.variable',
        sku: 'GalaxyBuds2024',
        brand: BrandModel(
            id: '3',
            image: assetImage.brandSamsung,
            isFeatured: true,
            name: TxtContents.brandSamsung,
            productCount: 50),
        images: [
          assetImage.product003_1,
          assetImage.product003_2,
          assetImage.product003_3,
        ],
        salePrice: 109.99,
        isFeatured: true,
        categoryId: '3',
        description:
            'Experience true wireless freedom with the Samsung Galaxy Buds. Enjoy clear and crisp audio wherever you go.',
        productAttributes: [
          ProductAttributeModel(
            name: 'Color',
            values: [
              'Black',
              'White',
              'Purple',
            ],
          ),
          ProductAttributeModel(
            name: 'Battery Life',
            values: ['6 hours', '12 hours'],
          ),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            sku: 'GalaxyBuds2024-1',
            stock: 15,
            price: 129.99,
            salePrice: 99.99,
            attributeValues: {'Color': 'Black', 'Battery Life': '6 hours'},
          ),
          ProductVariationModel(
            id: '2',
            sku: 'GalaxyBuds2024-2',
            stock: 10,
            price: 149.99,
            salePrice: 119.99,
            attributeValues: {'Color': 'White', 'Battery Life': '12 hours'},
          ),
          ProductVariationModel(
            id: '3',
            sku: 'GalaxyBuds2024-4',
            stock: 8,
            price: 159.99,
            salePrice: 129.99,
            attributeValues: {'Color': 'Purple', 'Battery Life': '12 hours'},
          ),
        ],
        date: DateTime.now()),

    ProductModel(
        id: '004',
        title: 'Redmi Watch 4',
        price: 89.99,
        stock: 20,
        thumbnail: assetImage.product004,
        productType: 'ProductType.variable',
        sku: 'RedmiWatch4',
        brand: BrandModel(
            id: '2',
            image: assetImage.brandMi,
            isFeatured: true,
            name: TxtContents.brandMi,
            productCount: 30),
        images: [
          assetImage.product004_1,
          assetImage.product004_2,
        ],
        salePrice: 79.99,
        isFeatured: true,
        categoryId: '2',
        description:
            'Stay connected and stylish with the Redmi Watch 4. Packed with features to enhance your daily activities.',
        productAttributes: [
          ProductAttributeModel(
            name: 'Color',
            values: [
              'Black',
              'Silver',
            ],
          ),
          ProductAttributeModel(
            name: 'Strap Material',
            values: ['Silicone', 'Metal'],
          ),
        ],
        productVariations: [
          ProductVariationModel(
            id: '1',
            sku: 'RedmiWatch4-1',
            stock: 10,
            price: 89.99,
            salePrice: 69.99,
            attributeValues: {'Color': 'Black', 'Strap Material': 'Silicone'},
          ),
          ProductVariationModel(
            id: '2',
            sku: 'RedmiWatch4-2',
            stock: 5,
            price: 99.99,
            salePrice: 79.99,
            attributeValues: {'Color': 'Silver', 'Strap Material': 'Metal'},
          ),
        ],
        date: DateTime.now()),
//tablets
    ProductModel(
      id: '005',
      title: 'Galaxy Tab S9',
      price: 799.99,
      stock: 50,
      thumbnail: assetImage.product005,
      productType: 'ProductType.variable',
      sku: 'GalaxyTabS9',
      brand: BrandModel(
        id: '3',
        image: 'path/to/samsung_logo.png',
        isFeatured: true,
        name: 'Samsung',
        productCount: 100,
      ),
      images: [
        assetImage.product005_1,
        assetImage.product005_2,
      ],
      salePrice: 749.99,
      isFeatured: false,
      categoryId: '7',
      description:
          'Discover the power of the Galaxy Tab S9 with stunning features and performance.',
      productAttributes: [
        ProductAttributeModel(
          name: 'Color',
          values: ['Mystic Black', 'Mystic Silver'],
        ),
        ProductAttributeModel(
          name: 'Storage',
          values: ['128GB', '256GB'],
        ),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          sku: 'GalaxyTabS9-128GB-Black',
          stock: 30,
          price: 799.99,
          salePrice: 749.99,
          attributeValues: {'Color': 'Mystic Black', 'Storage': '128GB'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'GalaxyTabS9-256GB-Silver',
          stock: 20,
          price: 899.99,
          salePrice: 849.99,
          attributeValues: {'Color': 'Mystic Silver', 'Storage': '256GB'},
        ),
      ],
      date: DateTime.now(),
    )
  ];

  static final List<BrandCategoryModel> brandsForCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '6'),//
    BrandCategoryModel(brandId: '3', categoryId: '6'),//
    BrandCategoryModel(brandId: '3', categoryId: '3'),
    BrandCategoryModel(brandId: '2', categoryId: '2'),
    BrandCategoryModel(brandId: '3', categoryId: '7'),
  ];
  static final List<ProductCategoryModel> productsForCategories = [
    ProductCategoryModel(categoryId: "6", productId: "001"),//
    ProductCategoryModel(categoryId: "6", productId: "002"),//
    ProductCategoryModel(categoryId: "3", productId: "003"),
    ProductCategoryModel(categoryId: "2", productId: "004"),
    ProductCategoryModel(categoryId: "7", productId: "005"),
  ];
}
