# Karabiner Elements

A tool to remap inputs on macOS.

## Enabling the config

The main configuration file is pretty big and contains information that is very specific to a device.
It also seems to me that the file is "owned" by the application, which will lead to changes made without user input.

To restore the configuration on a new system:

1. Install/start the software
2. `stow karabiner`
3. Click the icon, select "Settings"
4. Select "Complex Modifications" 
5. Click the "Add predefined rule" Button at the top
6. Click the "Enable" button on all rules linked from the config
7. The enabled rules will show up in the list and will be enabled

