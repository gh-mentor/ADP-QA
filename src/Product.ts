export const MIN_PRICE = 0.01;
export const MAX_PRICE = 1000;


export class Product {

    private id: number;
    private name: string;
    private price: number;


    private constructor(id: number, name: string, price: number) {
        this.id = id;
        this.name = name;
        this.price = price;
    }


    public static createProduct(id: number, name: string, price: number): Product {
        return new Product(id, name, price);
    }


    public getId(): number {
        return this.id;
    }


    public getName(): string {
        return this.name;
    }


    public getPrice(): number {
        return this.price;
    }


    public setPrice(price: number): void {

        if (price < MIN_PRICE || price > MAX_PRICE) {
            throw new Error(`The price must be between ${MIN_PRICE} and ${MAX_PRICE}`);
        }

        this.price = price;
    }


    public toString(): string {
        return `Product: ${this.name}, Price: ${this.price}`;
    }


    public save(): void {
        console.log(`Saving product: ${this.toString()}`);
    }
}