import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "field" ]

    focus(event){
        console.log(event.key)
        if(event.key === "Enter"){
            window.location.href = "/" + this.fieldTarget.value
        }
        /* Press "/" and the navbar is focused. The last comparison is to be able to type "/" when in the search bar*/
        else if(event.key === "/" && document.activeElement !== this.fieldTarget ) {
            event.preventDefault()
            this.fieldTarget.focus()
        }
    }

}
