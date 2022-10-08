import { Application } from "@hotwired/stimulus"
import {
  Alert,
  Autosave,
  Dropdown,
  Modal,
  Tabs,
  Popover,
  Toggle,
  Slideover,
} from "tailwindcss-stimulus-components";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

// from tailwind-css-stimulus-components
application.register("dropdown", Dropdown);

export { application }
