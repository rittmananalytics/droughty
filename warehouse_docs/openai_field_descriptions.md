{% docs harvest_invoice_line_item_pk %}


A Harvest Invoice Line Item PK is a primary key that uniquely identifies each item listed on a Harvest invoice. This primary key is used to access information about each line item on the invoice, including the amount, quantity, and any discounts or other modifiers that may have been applied to the line item.
{% enddocs %}
{% docs harvest_project_fk %}


A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship.
{% enddocs %}
{% docs harvest_invoice_fk %}


A harvest invoice foreign key is a field in a database table that links or references a row or record in another table. It is made up of the primary key from one table and is used as the foreign key in another table. The purpose of a foreign key is to ensure data integrity and establish relationships between tables.
{% enddocs %}
{% docs harvest_invoice_line_item_support_amount_billed %}


Harvest Invoice Line Item Support Amount Billed is a term used to describe the total amount of money billed to the customer on the line item of an invoice. It is the sum of the item or service being billed, along with any additional fees such as taxes, shipping, discounts, etc.
{% enddocs %}
{% docs harvest_invoice_line_item_is_taxed %}


A harvest invoice line item that is taxed is an invoice line item that includes the applicable sales tax amount, as dictated by local and state laws.
{% enddocs %}
{% docs client_pk %}


Client PK (Public Key) is an encryption key used to encrypt data that is sent between two parties. It is typically used in conjunction with a server key (private key) to provide asymmetric encryption, a technique that allows data transmission to be encrypted on one end, while allowing the decryption on the other end. It is also used to authenticate the identity of a server or client on a network.
{% enddocs %}
{% docs harvest_client_fk %}


A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data.
{% enddocs %}
{% docs jira_project_fk %}


A Jira project foreign key is an unique identifier associated with a particular Jira project, which allows the project to be linked to other records in the Jira system.
{% enddocs %}
{% docs harvest_invoice_pk %}


Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to.
{% enddocs %}
{% docs harvest_invoice_net_amount %}


Harvest Invoice Net Amount is the total amount remaining on a sent invoice after any credits, taxes, and discounts are subtracted.
{% enddocs %}
{% docs harvest_invoice_revenue_amount_billed %}


Harvest invoice revenue amount billed is the total amount the customer was invoiced for the harvest. This includes any discounts or promotional amounts due, and may also include any applicable taxes.
{% enddocs %}
{% docs harvest_client_invoice_sequence_nunber %}


Harvest Client Invoice Sequence Number is a unique numerical identifier assigned to each invoice created in the Harvest invoicing system. The identifier is unique and helps identify each invoice, ensuring accuracy when managing multiple invoices.
{% enddocs %}
{% docs jira_project_pk %}


JIRA Project PK is a unique identifier that is assigned to a project in JIRA. It is used to uniquely identify the project in the system. It is a part of the URL when navigating to a project in JIRA.
{% enddocs %}
{% docs jira_user_fk %}


A Jira user foreign key is a unique identifier that contains information related to a specific user who is accessing a Jira instance. It is used to link a user's data across different Jira instances or datastores. The value of the foreign key is typically an alphanumeric string and can be used to access user-specific data relative to their permissions.
{% enddocs %}
{% docs jira_daily_issue_field_history_pk %}


Jira Daily Issue Field History PK is a special field in Jira that keeps track of the changes that were made to an issue over time. It stores a new record whenever an issue is updated, and the data fields include: issue number, data and time of the change, name of user who made the change, and issue field that was changed. The records are stored in a unique format, or "PK," which is a protected key that keeps the records safe from unnecessary changes.
{% enddocs %}
{% docs jira_issue_fk %}


Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication.
{% enddocs %}
{% docs jira_daily_issue_field_history_status %}


Jira's Daily Issue Field History Status is a feature on the Jira platform that allows users to view the history of the changes that have been made to an issue's custom fields. This information is displayed in a timeline and includes the user who made the change, the date and time of the change, and the changes that were made. Additionally, a comment may also be attached to each change to explain the rationale behind it. This feature provides valuable insight into the progress of an issue over time and can be a useful tool for project managers, developers, and other stakeholders.
{% enddocs %}
{% docs jira_daily_issue_field_history_sprint %}


JIRA Daily Issue Field History Sprint is an Atlassian-powered feature that tracks the history of field changes for one or more selected issues over a period of time. It helps you to analyse the impact of different field changes on issues, estimate or review the progress of your team and identify major bottlenecks. It can also be used to get a better understanding of how work is progressing in a sprint or project.
{% enddocs %}
{% docs jira_daily_issue_field_history_date_day %}


The JIRA Daily Issue Field History Date Day is a field on the JIRA tracker that stores the date when an activity occurred on an issue. It is typically automatically set to the date of the activity, and can be searchable. This field can be used to track the history of an issue, including when tasks and conversations happened.
{% enddocs %}
{% docs harvest_employee_fk %}


A harvest employee foreign key is a field in a database table that is used to uniquely identify a particular record or row in another table. This is known as a foreign key because it relates to the primary key of another table, usually located in a different database.
{% enddocs %}
{% docs harvest_invoice_purchase_order %}


A harvest invoice purchase order is an order created by the purchaser, used to request goods or services from the vendor. It typically includes details on the goods or services requested, the quantity requested, and the agreed-upon pricing. This document serves as an agreement between the buyer and seller and serves as a legal document if any dispute should arise.
{% enddocs %}
{% docs harvest_invoice_state %}


Harvest Invoice state is a set of information stored by the system when an invoice is created in Harvest. Depending on the invoice status, that information may include its payment status, payment amount, date the invoice was created or sent, date the invoice was paid, email address used to send the invoice, and more.
{% enddocs %}
{% docs harvest_invoice_notes %}


Harvest invoice notes are optional fields added to invoices that are used to provide any additional information pertinent to the invoice—such as terms of payment or a special message for the customer. The notes are visible when viewing the invoice, and included in all invoices sent by Harvest.
{% enddocs %}
{% docs harvest_invoice_subject %}


Harvest Invoice subject lines typically include the words “Invoice” and a brief description of the services or goods sold. For example, “Invoice for Web Design Services” or “Invoice for Ad Design.”
{% enddocs %}
{% docs harvest_invoice_currency %}


Harvest Invoice currency is determined by the currency set on your invoice settings page. This page can be accessed from the Settings tab of your project. You can choose from US Dollars, Canadian Dollars, British Pounds, and Euro.
{% enddocs %}
{% docs harvest_invoice_payment_term %}


The payment term for a harvest invoice is typically 14 days net. This means that the full amount of the invoice is due to the seller 14 days after the invoice was issued.
{% enddocs %}
{% docs harvest_invoice_amount %}


Harvest Invoice Amount is the total value of the invoice after any deductions, discounts, taxes, and other fees have been applied.
{% enddocs %}
{% docs harvest_invoice_due_amount %}


The amount due for a harvest invoice depends on the terms of the invoice, such as payment terms and any discounts given. It could range from the full invoice amount to a percentage of the invoice amount. Additionally, taxes, late fees and other charges may be added in, which could influence the final amount due.
{% enddocs %}
{% docs harvest_invoice_discount_amount %}


Harvest Invoice Discount Amount is the amount of a discount taken off billed amounts that the customer can take advantage of after invoicing. The discount may be calculated according to a percentage, dollar amount, or a combination of both.
{% enddocs %}
{% docs harvest_invoice_discount %}


Harvest Invoice Discounting is a form of financial services that enables businesses to obtain quick advances on outstanding invoices. By using Harvest Invoice Discounting, businesses are able to gain access to cash much faster than traditional invoicing systems. As a result, businesses are able to grow and expand without the need to wait for full payment from client invoices. The process works by “discounting” the invoice amount at a predetermined rate and providing businesses with a lump sum.
{% enddocs %}
{% docs harvest_invoice_tax_amount %}


Harvest invoice tax amount is the amount of tax owed on an invoice that is being paid through Harvest. This tax amount may vary depending on the country and the tax rate imposed by the local governing authority.
{% enddocs %}
{% docs harvest_invoice_tax %}


Harvest Invoice Tax is a tax which is applied to invoices generated in the Harvest accounting software. It is used to more accurately report income and expenses for businesses, and is based on the business' country of origin and the state or province in which the business is located.
{% enddocs %}
{% docs harvest_invoice_period_start %}


A harvest invoice period start is the date that a billing period starts, usually when a new contract is in effect or an invoice is generated. It is usually used to define when an amount of payment is due.
{% enddocs %}
{% docs harvest_invoice_period_end %}


Harvest Invoice Period End is a feature within Harvest that allows you to set an end date for any invoices that you choose to generate. This end date is set so that all invoices that were created will be marked as “complete” by the specified period end.
{% enddocs %}
{% docs harvest_invoice_paid_date %}


Harvest invoice paid date is the date on which the invoice is paid by the customer. It is up to the customer to decide when to make the payment, and this date may vary depending on their payment terms.
{% enddocs %}
{% docs harvest_invoice_issue_date %}


The issue date of a harvest invoice will depend on the individual vendor and their chosen accounting system. Generally, the issue date is the same as the date of the service or sale.
{% enddocs %}
{% docs harvest_invoice_due_date %}


Harvest invoice due dates vary according to the payment terms set up with each customer. Most pay invoices within 15 to 30 days of the invoice date.
{% enddocs %}
{% docs harvest_invoice_created_at %}


A Harvest invoice is usually created when a payment is made for a service or product. The date of creation is typically the date of purchase.
{% enddocs %}
{% docs harvest_invoice_sent_at %}


Harvest invoice sent at is the time that an invoice is generated and sent to a customer or client. This is typically done through email or another online billing system. The invoice can include details of the goods and services bought and any applicable payment terms, taxes, and fees.
{% enddocs %}
{% docs harvest_invoice_paid_at %}


A harvest invoice is typically paid at the time of delivery, or within the stipulated payment terms stated in the invoice.
{% enddocs %}
{% docs harvest_invoice_updated_at %}


The exact date an invoice is updated at will depend on several factors, such as the type of invoice being updated, the type of product being purchased, and the location of the seller. Many invoices on Harvest also have the date of the last update listed near the top of the page.
{% enddocs %}
{% docs harvest_project_pk %}

Harvest Project PK is an NGO based in Pakistan that works to build a better future for vulnerable communities. The organization focuses on empowerment, especially for women, through education, health, and sustainable development. Their initiatives have had an impact on nearly 1 million people in 300+ villages. Their main mission is to unlock Pakistan’s potential to end poverty by 2030 and to ensure that all people, regardless of gender, socio-economic status, access to resources, and skill level, can thrive, participate, and contribute to the development of their communities.
{% enddocs %}
{% docs jira_field_pk %}


Jira Field PK (primary key) is an automatically generated, unique identifier used when creating a Jira issue. It is used to uniquely identify each Jira issue and is typically made up of a combination of numbers and letters.
{% enddocs %}
{% docs person_pk %}


Person PK is an acronym for "person primary key", which is an unique identifier used to identify a specific person in a database. It is usually a number or code that is associated with a single person.
{% enddocs %}
{% docs jira_issue_sprint_bridge_pk %}


Jira Issue Sprint Bridge PK is an add-on for Jira Cloud and Jira Server. It provides project managers with a way to connect Jira issues to sprints, allowing teams to better coordinate their sprints and manage their back logs more efficiently. The add-on helps to bridge the gap between sprint planning and task execution, providing PMs and developers with an insight into which issues are associated with which sprint and what the progress of each issue is.
{% enddocs %}
{% docs jira_sprint_fk %}


Jira Sprint Foreign Key is a unique identifier for a Jira Sprint. It is an alphanumeric string of characters created by Jira when a sprint is created. Foreign Key can be used to keep track of different sprints and is also used to link sprints to related data in an external system.
{% enddocs %}
{% docs harvest_client_pk %}


Harvest Client PK is an ID belonging to each client in Harvest. It is a unique ID used to identify each individual client, and can be found in the URL when viewing the client profile.
{% enddocs %}
{% docs jira_issue_board_bridge_pk %}


Jira Issue Board Bridge PK is a generic tool that provides integration between Jira Issue Board and any third-party system, allowing teams to share data and create a seamless collaboration workflow. It allows users to update Jira tickets from issue boards, and update issue boards from Jira tickets. It also enables sharing of custom fields between the two systems. Jira Issue Board Bridge can be used for synchronizing changes between Jira plans and external systems, such as project management tools, customer service applications, and many others.
{% enddocs %}
{% docs jira_board_fk %}


A JIRA board foreign key is a column in a database table that establishes a relationship between two tables. It is used to ensure that the values in the foreign key field are only those allowed in the primary table. It also ensures that any changes made to the primary table are reflected in the related foreign table.
{% enddocs %}
{% docs harvest_expense_pk %}


Harvest expense pk is an accounting software designed to help businesses automate their expense tracking, create detailed budgeting reports, and provide detailed financial reporting. It integrates with popular accounting software, such as QuickBooks and Xero, to offer a comprehensive solution for businesses of all sizes.
{% enddocs %}
{% docs jira_sprint_pk %}


Jira Sprint PK is a new feature of Jira, which allows users to plan and track their sprints (short-term development cycles) more easily and efficiently. The feature provides users with a central hub for planning, tracking, and reporting on their sprints. It also allows users to monitor the progress of their sprints, view detailed reports, and visualize the data collected.
{% enddocs %}
{% docs jira_sprint_name %}


In Jira, sprints are referred to as 'sprints'.
{% enddocs %}
{% docs jira_sprint_goal %}


Jira Sprint Goals are objectives set by teams at the start of each sprint in order to provide focus and measure progress throughout the sprint. Sprint Goals are typically set collaboratively by the team in order to create alignment and understanding of the work being done over the sprint by all stakeholders. They can also provide a reference point to assess whether the sprint was successful after it is complete.
{% enddocs %}
{% docs jira_sprint_state %}


In Jira, a sprint is a period of time for completing a set of tasks. At the start of the sprint, tasks are chosen from the backlog list and their progress is tracked throughout the sprint. The sprint state indicates where a sprint is in its lifecycle, such as "Active", "Completed", or "Cancelled".
{% enddocs %}
{% docs jira_start_at_date %}


Jira start date refers to the date when a project, task, or issue was first created in Jira. This is usually the date when the item was first entered into the system and can often be different than the date when the item was actually started.
{% enddocs %}
{% docs jira_complete_at_date %}


Jira Complete at Date is an Automation capability in Jira software that helps teams track and manage the progress of a project by enforcing due dates for items to be completed. It allows users to set global and individual due dates across multiple projects and teams, ensuring that deadlines are kept and projects move forward.
{% enddocs %}
{% docs jira_end_at_date %}


Jira end date is the completion date for a project, issue, or task. It is usually determined when the Jira project is created or when an issue or task is defined. It is important to have an end date that is realistic, achievable and allows for some flexibility.
{% enddocs %}
{% docs harvest_timesheet_pk %}


Harvest Timesheet PK is a web application designed to help small businesses and freelancers track their time and expenses. It allows users to easily log their time with a simple and intuitive web interface, and also compare their timesheets to track performance and profitability. Harvest Timesheet PK is designed to be easy to use and efficient with features such as timers, reports, financial forecasts, and more.
{% enddocs %}
{% docs harvest_external_reference_jira_fk %}


Harvest External Reference JIRA Foreign Key is an attribute associated with a JIRA entity that stores the user's Harvest ID for identity mapping and historical reporting. This foreign key is used to link the user's Harvest account with its corresponding JIRA account, allowing for traceability and accurate reporting.
{% enddocs %}
{% docs harvest_task_fk %}


A foreign key in a harvest task is a field or columns in a relational database table that links two tables together. It is used to connect one table to another and establish a relationship between them. For example, a foreign key in a harvest task table may link the harvest task table to a crop table, allowing the harvest task table to access information from the crop table.
{% enddocs %}
{% docs harvest_task_assignment_natural_key %}


A harvest task assignment natural key is a unique identifier used to identify a particular task assignment in a harvest system. It is typically a combination of the task and worker IDs that uniquely identify the assignment, and allow users to track and monitor the progress of the assignment.
{% enddocs %}
{% docs harvest_timesheet_notes %}


Harvest Timesheet Notes is a feature within the Harvest time tracking app that allows users to jot down notes while they are completing their timesheets. Users can add notes to keep track of how they spent their time and to document tasks that are relevant to the clients and projects they are working on. Not only does the feature provide a convenient way to keep track of the time a user has worked, it also creates a record for a project manager or client to look back on for information regarding the project.
{% enddocs %}
{% docs harvest_timesheet_locked_reason %}


Harvest Timesheet Locked Reason is typically when an administrator or manager has locked a timesheet in order to prevent any changes being made to the timesheet. This may be done to prevent an employee from adjusting their timesheet, or to ensure timesheet accuracy.
{% enddocs %}
{% docs harvest_timesheet_billable_rate %}


The "billable rate" is the amount of money per hour that an employee will be expected to charge clients for the services provided. This rate is often negotiated between the employee, employer and client and may vary depending on the particular job and individual.
{% enddocs %}
{% docs harvest_timesheet_cost_rate %}


The cost rate associated with Harvest Timesheet is dependent on the plan you choose. The free plan allows you to track up to two projects and two users, while the paid plans start at $12/month for up to five users and 10 projects.
{% enddocs %}
