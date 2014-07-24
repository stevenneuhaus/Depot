require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products
  test "product attributes not empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "product must have unique title" do
    product = Product.new( title:  products(:fixture_test).title,
                           description: "aaa",
                           price: 123.45,
                           image_url: "bbb.jpg")
    assert product.invalid?
    assert_equal ["has already been taken"],
      product.errors[:title]
  end


  test "product price must be positive" do
    product = Product.new(title:       "my book",
                          description: "zzz",
                          image_url:   "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    product=Product.new(title: 'ABC', description: "easy as", price: 123,
      image_url: image_url)
  end

  test "image url" do
    ok = %w{ sjn.gif sjn.jpg sjn.png sjn.JPG sjn.Jpg http://a.b.c./sjn.jpg}
    bad = %w{sjn.doc sjn.rtf sjn sjn.tiff sjn.svd sjn.ai sjn.psd sjn.pdf}

    ok.each do |name|
      assert new_product(name).valid? "${name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid? "${name} should not be valid"
    end
  end

end
