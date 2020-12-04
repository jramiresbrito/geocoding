require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// External imports
import "bootstrap";

// Internal imports
import { initMapbox } from '../plugins/initMapBox'
import { initAlgolia } from '../plugins/initAlgolia';


document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAlgolia();
});
