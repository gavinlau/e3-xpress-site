class BlogItem {
  private _title: string
  private _content: string
  constructor(title: string, content: string) {
    this._title = title
    this._content = content
  }

  get title() {
    return this._title
  }

  set title(title: string) {
    this._title = title
  }
}
export function useBlogItem(title: string, content: string) {
  const item: BlogItem = new BlogItem(title, content)
  return item
}
