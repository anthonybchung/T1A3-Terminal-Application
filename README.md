### Requirement 4 - Source control repository:
GitHub
https://github.com/anthonybchung/T1A3-Terminal-Application

Trello:

### Requirement 5 - Code Style

Following the style guide on the following website and Rubocop for code styling and styling convention.

- https://clearwater.readthedocs.io/en/stable/Clearwater_Ruby_Coding_Guidelines.html

### Requirement 6 - Proposal

The following were sent for proposal:

|![Proposal message](/docs/T1A3-Terminal%20App%20Proposal.png)|
-

Figure 6.1 : Attachment sent to educator.

### Requirement 7 - Implementation Plan.

### Iteration Zero
#### Stories (Features)
Initial idea or features of the application.
|![User Story Mapping](/docs/User-Story-Mapping-one.jpg)|
-
Figure 7.1 User Story Mapping

The target time taken for each user story (ie green card) will be **half hour(30 mins)**. From creating a test, to building the code and refractoring.

#### Test Driven Development

|![Test Driven Development](/docs/TDD.png)|
-
Figure 7.2 Test Driven Development

According to Robert Martin the 3 rules of Test Driven Development are:

- Do not write any code before you write a test that fails.
- Do not write more of a test than it is sufficient to fail.
- Do not write code that is more than sufficient to pass the test.

So during the development of application, a small test was built, just enough for the code to fail. Then codes were modified or new codes were built to pass the test. Then a new small test was built. A time period for this cycle is meant to be short (30 to 60 sec)(Martin, Advanced TDD).

However, for a novice, this process was taking longer than expected thus the user story mapping was revised. The plan was to build a minimal value product (MVP).

|![User Story Map v2](/docs/User-Story-Mapping-revised.jpg)|
-
Figure 7.3 on the wall

|![User Story Map v2](/docs/MVP.png)|
-
Figure 7.4 transfered to lucid chart

#### Flow Charts
##### Main Level

|![Main Level Flow Chart](/docs/main_rb.png)|
-
Figure 7.5 Main Level Flow Chart

The application will have a switch case when it accepts ARGV

- null : which will run the actual user's data
- demo : mock data are pre-installed into the application
- help : help documents for the user


The application is divided into 3 sections
  
  - New Invoice
  - Retrieve Invoice (will only display up if invoice file is not empty)
  - Analyse Data (will only display if invoice file is not empty)

If the user is in **demo** mode, the application will exit after the user choose to exit. However, if it is in **normal** mode, and when the user choose exit, the application will copy the data from the temp files to stored files (suffix "_actual")

###### New Invoice

|![New Invoice](/docs/New%20invoice.png)|
-
Figure 7.6 Flow chart for New Invoice

The processes where the uer needs to type in the data have classes that will handle errors if the user does not enter the correct data in the correct format.
A **UserSelection** class was built to handle the user selection which will be used in the Data Input section (reused for fuel_type,fuel_brand, and location) and Retrieve Data section. It is also used for file input/output.
A class(**InvoiceInterface**) was built to handle the modification of the data in the User Input section and Unser Retrieve data of the application.

|![New invoice classes](/docs/Input%20classes.png)|
-
Figure 7.7 Input classes

Once the user confirms the data, it is written to the tempory file (invoice.json)

###### Retrieve Invoice

In this section a table listing all the invoices will be displayed. The user can choose an invoice for updating the data.
**UserSelection** class is reused to assist in updating the data.
Some tables that display data need to be used in several places of the application. Thus 3 view classes were built for reusability(see Fig 7.9).

|![Retrieve Invoice](/docs/Retrieve%20invoice.png)|
-

Figure 7.8 Retrieve Invoices

|![View Classes](/docs/view%20classes.png)|
-

Figure 7.9 Classes to view tables
###### Data Analysis
A view class will be used to list all the invoices.
The user then can pick which two invoices is needed to do the calculations for the required data.

|![Data Analysis Flow chart](docs/Analyse%20Invoice.png)|
-

Figure 7.10 Data Analysis Flow chart.

#### Testing (Rspec)
Rspec was used in the development of this application.
The test were mainly used to exam the error handling of user input format.

#### Bash Script
The script is **fueltracker.sh** in the src directory.
To run it type the following in the terminal

```
cd to src
for demo
./fueltracker.sh demo

for actual with no pre-installed data
./fueltracker.sh

for help
./fueltracker.sh -help
```
##### Reference

- Martin, R., 2020. Clean agile. Pearson Education Inc, pp.66-69.
- Francino, Y. The essential guide to user story creation for agile leaders. https://techbeacon.com/app-dev-testing/essential-guide-user-story-creation-agile-leaders
- Martin, R., 2014. Advanced TDD: The Transformation Priority Premise. https://vimeo.com/97516288


### Requirement 8 - Help Documentation

