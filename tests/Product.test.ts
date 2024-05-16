import { Product, MIN_PRICE, MAX_PRICE } from '../src/Product';

describe('setPrice', () => {
  let product: Product;

  beforeEach(() => {
    product = Product.createProduct(1, 'Product 1', 100);
  });

  it('should set the price correctly when a valid price is provided', () => {

  });

  it('should throw an error when the price is less than the minimum price', () => {

  });

  it('should throw an error when the price is more than the maximum price', () => {

  });
});