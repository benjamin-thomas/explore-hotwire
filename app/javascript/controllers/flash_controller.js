import { Controller } from "@hotwired/stimulus"

// noinspection JSUnusedGlobalSymbols
export default class extends Controller {
  remove() {
    // noinspection JSUnresolvedVariable
    this.element.remove();
  }
}
