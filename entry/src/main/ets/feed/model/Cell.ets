/**
 * feed cell
 */
export class Cell {
  title: string
  imageSrc: Resource
  viewType: ViewType
}

export enum ViewType {
  TEXT,
  BIG_IMAGE
}