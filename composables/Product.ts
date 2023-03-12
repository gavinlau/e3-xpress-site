class Product {
  private _title: string
  private _price: number
  private _originPrice: number
  private _limitedPrice: number
  private _thumbnail: string
  constructor(title: string, price: number, originPrice: number, limitedPrice: number, thumbnail: string) {
    this._title = title
    this._price = price
    this._originPrice = originPrice
    this._limitedPrice = limitedPrice
    this._thumbnail = thumbnail
  }

  get title() {
    return this._title
  }

  set title(title: string) {
    this._title = title
  }

  get price() {
    return this._price
  }

  set price(price: number) {
    this._price = price
  }

  get originPrice() {
    return this._originPrice
  }

  set originPrice(originPrice: number) {
    this._originPrice = originPrice
  }

  get limitedPrice() {
    return this._limitedPrice
  }

  set limitedPrice(limitedPrice: number) {
    this._limitedPrice = limitedPrice
  }
}
