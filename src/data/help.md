### App Description
This app is to track fuel expenses and usage.

The app was build with Ruby and tested on a mac-OS.

### Installation
- Download all files from src
- run bundle install to install all the required gems
- Make sure fueltracker.sh is executable. If not do the following on the terminal in src directory
  
```
bundle install

chmod +x fueltracker.sh
```

### Usage
There are three modes to run Fuel Tacker.
#### Help
```
  . fueltracker help
```
or
```
  . fueltracker.sh -h
```
or
```
  . fueltraacker.sh -help
```
This will bring up a help file on the terminal.

#### Demo
```
  . fueltracker demo
```
This will load fuel tracker with dummy data for the user to get a hang of the app.
The user can add invoices, modify data and look at the analysed data.
User will not be able to save data on demo mode.

### Actual running
```
  . fueltacker
```
This will run the actual app with no dummy data.

#### First Screen
```
Select an option (Press ↑/↓ arrow to move and Enter to select)
‣ Input New Invoice
  Retrieve List of Invoices
  Analyse Data
  Delete all invoice
  Exit
```
  The following will only appear with there are invoices store in the system.
```
  Retrieve List of Invoices
  Analyse Data
  Delete all invoice
```
#### Input New Invoice

- First Input: Date
```
  Enter invoice date (dd-mm-yyyy):
```
The format must be in day-months-year, or else the application will raise an error and ask the question again

  - Second Input: Odometer
```
  Enter odometer distance km(must be an integer):
```
Must be an integer or else the system will raise an error and ask the question again.

- Third Input: Paid price
```
  Enter Paid Price $(xx.xx):
```
The total amount the user has to pay for the fuel. It must be a valid currency format (e.g: $59.88 without the dollar sign)

- Forth Input: Fuel Price per Litre
```
  Enter Fuel price per Litre cent(xxx.x):
```
The fuel price is in cent as displayed at the petrol station. It must be in a valid format or else an error will be raised.

- Fifth Input: Fuel Quantity
```
  Enter Fuel Quantity Litre(xxx.xx)
```
Quantity is in Litre and accept inputs to 2 decimal places only. An error will be raised if number does not have 2 decimals

- Sixth Input A: Fuel Type
```
  Select fuel type  option (Press ↑/↓ arrow to move and   Enter to select)
  ‣ E-10
    UL-91
    LAF-91
    V-Power-100
    Add option
```
Will give a user a list of options. If the option is not available, the user can add a new option.

- Sixth Input B: Option
```
  Enter new fuel type 
```
User can add any text because each company will have their own product names.

- Seventh Input: Brand Name
```
  Select fuel brand  option (Press ↑/↓ arrow to move and Enter to select)
  ‣ AMPOL
    SHELL
    Mobil
    Add option
```
The method of input is the same as Fuel Type

- Eighth Input: Location
```
  Select location  option (Press ↑/↓ arrow to move and Enter to select)
  ‣ Kingsford
    Mascot
    Maroubra
    Alexandria
    Add option
```
The method of input is the same as Fuel Type

- Confirming data
```
  ┌───────────────┬──────────┐
  │Attribute      │Data      │
  ├───────────────┼──────────┤
  │Date           │12-12-2002│
  │Odometer(km)   │12443     │
  │Paid($)        │2132.22   │
  │Fuel Price($/L)│23.3      │
  │Fuel Qty(l)    │213.44    │
  │Fuel Type      │E-10      │
  │Fuel Brand     │AMPOL     │
  │Location       │Kingsford │
  └───────────────┴──────────┘
  Are all the above data correct? (Y/n) 
``` 
If the user is satisfied with their inputs, they can press y to continue back to the main menu. Otherwise, the application will take them to a list of options.

```
Select an option? 
  1) Date
  2) Odometer
  3) Paid
  4) Fuel Price
  5) Fuel Quantity
  6) Fuel Type
  Choose 1-9 [1]: 
(Press tab/right or left to reveal more choices)
```
From there the application will take the user back to the choosen input.
Option 9 is for cancelling the modification.

#### Retrieve List of Invoices

Will display a list of Invoices.
The user can choose which invoice they want to modify.
The process is the same as above, modifying the data after entering all the data.

#### Analyse Data
Will display a list of Invoices like above.

```
History of all the invoices

Do you want to analyse data? (Y/n) 
```

```
History of all the invoices

Do you want to analyse data? Yes
Enter the starting index [1-5]
1
Enter the ending index [2-6]

```
User will be able to choose the initial invoice index for analysis. Then the ending invoice index for analysis

After analysis, a table will list all the analysed data.
The user can either press any key to contiue or the application will return to main menu after 3 minutes.


#### Delete all invoice
This will allow the user to clear the invoice file.

#### Exit
exit the application