{% docs harvest_invoice_line_item_pk %}


A harvest invoice line item pk (also referred to as a harvest invoice line item primary key) is a unique identifier assigned to each invoice line item within a given harvest invoice. This identifier is used to distinguish and identify each invoice line item from all other line items on the invoice.
{% enddocs %}
{% docs harvest_project_fk %}


A foreign key in the Harvest Project is a field, or set of fields, designed to establish a link between two tables in a database. It is a concept used to ensure data integrity and to maintain relationships between two tables. The foreign key is typically the primary key of one table, and it is referenced as a foreign key in the other table.
{% enddocs %}
{% docs harvest_invoice_fk %}


A harvest invoice foreign key is a type of foreign key in a database that acts as a link between a harvest invoice table and another related table. The foreign key is a field in the related table that acts as a unique identifier for each row in the harvest invoice table, allowing data from the harvest invoice table to be easily referenced and joined with other related tables.
{% enddocs %}
{% docs harvest_invoice_line_item_kind %}


A harvest invoice line item kind is an entry in an invoice that describes a specific item or service on the invoice. These are usually categorized by specific categories, such as product, consulting service, or other service. Each harvest invoice line item usually includes a description of the item or service, a unit price, and a quantity, all of which are used to calculate the total cost of a given line item.
{% enddocs %}
{% docs harvest_invoice_line_item_description %}


A harvest invoice line item description is a short description that explains the contents of the line item on an invoice. For example, it might include the product's name, size, color, or other relevant details.
{% enddocs %}
{% docs harvest_invoice_line_item_amount %}


A harvest invoice line item amount is the total amount for each item listed on an invoice. It includes the cost of the item and any applicable taxes.
{% enddocs %}
{% docs harvest_invoice_line_item_unit_price %}


The term "harvest invoice line item unit price" generally refers to the rate of a single product or item on an invoice. This rate usually includes any applicable taxes and discounts.
{% enddocs %}
{% docs harvest_invoice_line_item_quantity %}


A harvest invoice line item quantity is the number of units of a particular item that are purchased or sold in a given transaction. It is a required field in most invoices.
{% enddocs %}
{% docs harvest_invoice_line_item_services_amount_billed %}


Harvest invoice line item services amount billed is the total dollar amount billed for the services on the invoice line item.
{% enddocs %}
{% docs harvest_invoice_line_item_license_referral_fee_amount_billed %}


Harvest invoice line item license referral fee amount billed is the total amount billed to the customer for a license referral fee. This fee is charged when a customer purchases or renews a license through a referral or partner program.
{% enddocs %}
{% docs harvest_invoice_line_item_expenses_amount_billed %}


A Harvest invoice line item expense is an amount billed for a specific expense incurred while working on a project or task. Expenses listed on an invoice can include anything from travel and materials costs to labor or service charges.
{% enddocs %}
{% docs harvest_invoice_line_item_support_amount_billed %}


A Harvest Invoice Line Item Support Amount Billed is an optional field on a Harvest Invoice Line Item that allows you to enter the amount of the invoice line item that was billed.
{% enddocs %}
{% docs harvest_invoice_line_item_is_taxed %}


A harvest invoice line item is taxed if the item is purchased within the state and jurisdiction where the business is located and taxes are applicable for the item being purchased. For example, a business selling a taxable item in New York State would have to charge sales tax for each harvest invoice line item.
{% enddocs %}
{% docs client_pk %}


Client public key (PK) is a form of cryptography that is used to establish a secure connection between two points. It is an asymmetric key, which means it consists of two parts: the public key and the private key. The private key is kept secure and never shared, while the public key is used to authenticate the connection.
{% enddocs %}
{% docs harvest_client_fk %}


A harvest client foreign key is a unique identifier that is attached to each client in the Harvest client database. It is used to cross-reference data from different sources and ensure each client record is associated with the correct data from other systems.
{% enddocs %}
{% docs jira_project_fk %}


A Jira project foreign key is a unique key that identifies a record in an external system for integration between Jira and other applications. It is usually used to link tasks and other records in Jira to the corresponding entries in an external source or application. The key is sent from the external system to Jira with data and links that can be used to track performance and progress of tasks in Jira.
{% enddocs %}
{% docs harvest_invoice_pk %}


Harvest Invoice PK is an open source, web-based billing and invoicing package designed specifically for small businesses. It allows users to customise invoice, bill, and timesheet templates, and then send them out to customers, clients, and contractors. Harvest Invoice PK includes built-in tools for accepting online payments, automating payment reminders, tracking and managing unpaid invoices, and easily integrating with other business tools and services.
{% enddocs %}
{% docs harvest_invoice_net_amount %}


Harvest Invoice Net Amount is the total amount due for an invoice after discounts, taxes, and other fees have been deducted. It is the amount a customer must pay in order to fulfill an invoice.
{% enddocs %}
{% docs harvest_invoice_revenue_amount_billed %}


The exact harvest invoice revenue amount billed will vary based on the products and services being sold.
{% enddocs %}
{% docs harvest_client_invoice_sequence_nunber %}


In accounting and bookkeeping, the Harvest Client Invoice Sequence Number (usually abbreviated to CIN) is a unique identifier that is assigned to each invoice created in Harvest, and it is primarily used to identify individual invoices. The CIN is a tracking tool used to ensure that all invoices, credit memos, payments, and adjustments are properly recorded, tracked, and accounted for.
{% enddocs %}
{% docs jira_project_pk %}


Jira Project Key (or PK) is a short alphanumeric identifier used by Jira projects to uniquely identify a project. It can be found in the URL of your project when it's loaded in the Jira browser.
{% enddocs %}
{% docs jira_user_fk %}


Jira user foreign key is a unique identifier in the Jira database that links a user record to another table, such as an Issue table or a Project table. This key is used to keep track of the various Jira user accounts created.
{% enddocs %}
{% docs jira_project_name %}


Jira is a project management and issue tracking software developed by Atlassian. A project name in Jira is an identifier used to differentiate one project from another. For example, an organization may have multiple software development projects, and each one could have a unique project name.
{% enddocs %}
{% docs jira_project_description %}


Jira is a project management and issue tracking software designed to help teams manage their projects, track bug fixes and new feature development, and stay on top of tasks and deadlines. It offers Gantt charts, project templates, agile boards, reporting, and more. It is best suited for cross-functional teams of any size and allows users to collaborate, prioritize tasks, and transfer tasks between teams.
{% enddocs %}
{% docs jira_project_key %}


JIRA project keys are unique identifiers that are usually between two and four characters in length. They are used to identify and reference a specific JIRA project throughout the system.
{% enddocs %}
{% docs jira_project_project_type_key %}


The Jira project type key is a unique identifier for a project that is stored in the Jira system. It is typically formatted as a two letter code followed by a six digit number e.g. PX-123456. This unique identifier is used to reference a project within the Jira system, and is required when creating a Jira ticket.
{% enddocs %}
{% docs jira_project_epics %}


Jira project epics are larger pieces of work that can be broken down into smaller tasks. Examples may include a product launch, major website or application re-design, or new software development project. Epics are typically tracked in Jira to help teams stay organized and easily manage complex projects. By breaking down a larger Epic into smaller, more manageable tasks, teams can work efficiently and get the job done quicker.
{% enddocs %}
{% docs jira_project_components %}


Jira Project Components are elements within a Jira Project used to organize and categorize work. Components are created and managed by Jira Project Administrators and are typically used to represent different areas of work within a Jira Project. For example, components could represent parts of your application or different teams working on a project. Each component is typically associated with a specific Jira project, but may also be shared between multiple projects. Components are usually configured to have their own Issue Type, Priority, Labels, and Versions.
{% enddocs %}
{% docs jira_project_count_closed_issues %}


The exact count of closed issues in a Jira project will depend on the specific project and its settings. You can access this information by navigating to the project's Issues tab, selecting the Status field, and then counting the number of issues with a Closed status.
{% enddocs %}
{% docs jira_project_count_open_issues %}


Jira does not provide exact counts of open project issues or any other metric. However, each project in Jira can have its own filter, query, or dashboard view that can be used to track open issues specific to a project.
{% enddocs %}
{% docs jira_project_count_open_assigned_issues %}


There is no way to determine an exact number as Jira projects often contain multiple assigned issues and the number of open assigned issues can vary depending on the specific project.
{% enddocs %}
{% docs jira_project_avg_close_time_days %}


The average time required to close a Jira project varies depending on the complexity of the project, the size of the team, and the individual timelines. Generally, most projects take 7-14 days to close in Jira.
{% enddocs %}
{% docs jira_project_avg_assigned_close_time_days %}


There is no set average close time for Jira projects as it will depend on the complexity of the project, the availability of resources, and other factors. Generally, it's best to set expectations for project completion based on the specific requirements of the project.
{% enddocs %}
{% docs jira_project_avg_age_currently_open_days %}


There is no one answer to this question because it will depend on the specific JIRA project and the age of the tasks or issues that are currently open.
{% enddocs %}
{% docs jira_project_avg_age_currently_open_assigned_days %}


Unfortunately, there is no single answer to this question. The average age for a Jira project will depend on the specific tasks assigned to the project and how long it takes to complete them. Some projects may take days, while others may take months or even years.
{% enddocs %}
{% docs jira_project_median_close_time_days %}


The Jira project median close time days is the average number of days it takes to close a project in Jira. This is calculated by taking the total amount of days it takes to close all projects and dividing it by the number of projects. The median close time days for a Jira project can vary greatly depending on the features, collaborations, and the complexity of the project.
{% enddocs %}
{% docs jira_project_median_age_currently_open_days %}


Jira does not track the age of open projects. If you want to track the timeframe for a project, you can use a custom field to keep track of the project's start date or a calculation field to calculate the number of days open.
{% enddocs %}
{% docs jira_project_median_assigned_close_time_days %}


This is not a metric that is tracked in Jira. Jira does not provide any hard metric for this type of data. You may be able to get some meaningful statistics by tracking the work items within your project and seeing how long it takes for tickets to be closed.
{% enddocs %}
{% docs jira_project_median_age_currently_open_assigned_days %}


Unfortunately, there is no definitive answer to this question as the median age of a Jira project will vary depending on the individual project, the size of the project, and the complexity of the tasks.
{% enddocs %}
{% docs jira_project_avg_close_time_seconds %}


Jira does not provide a specific average close time for projects. The amount of time it takes to close a project can vary greatly depending on the size of the project, the resources available, and the workflow that is utilized.
{% enddocs %}
{% docs jira_project_avg_assigned_close_time_seconds %}


Jira does not provide any data on the average assigned close time for projects, since this depends heavily on the specific project, its complexity and the team working on it.
{% enddocs %}
{% docs jira_project_avg_age_currently_open_seconds %}


There is no specific answer to this question as the age of a Jira project will vary depending on how long the project has been open and active.
{% enddocs %}
{% docs jira_project_avg_age_currently_open_assigned_seconds %}


There is no definitive answer to this question as the average age of a Jira project will depend on many factors including the size of the project, the complexity of the tasks, the number of people working on it, and the amount of time each person spends working on it.
{% enddocs %}
{% docs jira_project_median_close_time_seconds %}


Jira does not report project median close time in seconds. Jira does report project median close time in days, however.
{% enddocs %}
{% docs jira_project_median_age_currently_open_seconds %}


Jira Project Median Age Currently Open cannot be determined in seconds, as there is no exact timeframe available for how long open projects in Jira typically stay open.
{% enddocs %}
{% docs jira_project_median_assigned_close_time_seconds %}


There is no definitive answer to this question as it depends on the specific JIRA project and type of tasks that are being addressed. The median time for different projects can vary widely, and it will often vary even within a single project. For this reason, it is best to use JIRA's native reporting tools to evaluate the median assigned close time for a given project.
{% enddocs %}
{% docs jira_project_median_age_currently_open_assigned_seconds %}


Jira does not have a project median age. Each project has its own unique timeline based on the user's specifications.
{% enddocs %}
{% docs jira_daily_issue_field_history_pk %}


The JIRA Daily Issue Field History PK is a field in the JIRA Daily Issue Report that tracks a unique value assigned to each entry. This is to identify and track how often any given daily report is opened, and can help identify issues that are frequently opened and may require further investigation.
{% enddocs %}
{% docs jira_issue_fk %}


The Jira Issue Foreign Key is an internal identifier that Jira uses to identify a specific issue from its database. This identifier is used in various API calls and to link issues. It consists of a combination of the Issue Id (e.g. TST-1234) and the Project Key (e.g. TST), separated by a hyphen.
{% enddocs %}
{% docs jira_daily_issue_field_history_status %}


The Daily Issue Field History Status in Jira is a reporting tool that provides the user with data and analytics on the issues associated with a particular project. It shows the total number of issues, unresolved issues, how many were created and resolved, and how long it took to resolve them. This data can then be used to help identify areas of improvement.
{% enddocs %}
{% docs jira_daily_issue_field_history_sprint %}


JIRA Daily Issue Field History Sprint is a set of reports that allow users to view the history of all changes to a particular field that occurred over the course of a specific sprint. This report can provide insight into how teams modify the field values for various issues and the trends that emerge over time. The data can be used to create a better understanding of any irregularities and can help answer questions like “What field changed the most?”, “Who changed the field?” and “When did the field change?”.
{% enddocs %}
{% docs jira_daily_issue_field_history_date_day %}


Jira Daily Issue Field History Date Day is simply the date on which an issue was last updated in Jira. The field displays the most recent update, which could be the addition of a new comment, the transitioning of an issue to a different state, or the creation of a new issue.
{% enddocs %}
{% docs harvest_invoice_pk %}


A harvest invoice PK is the primary key for a harvest invoice, which is a document generated by the seller to record the details of the sale of agricultural products such as crops or livestock. It includes details of the amount, types and quantity of the products sold and is used as proof of the transaction in case of disputes.
{% enddocs %}
{% docs harvest_client_fk %}


A harvest client foreign key is a unique identification number assigned to each client within a harvest client management system. This number is used as a reference to link all tasks, invoices, and other related information back to the client. It helps to keep records organized and linked to the correct client.
{% enddocs %}
{% docs harvest_employee_fk %}


The harvest employee foreign key is a special type of ID assigned to employees of a company. This ID allows them to be linked to the corresponding records within the organization’s database. The employee’s details such as name, address, contact number, and salary can all be linked to the foreign key. It's used to easily identify the employee or find their records within the system. Generally, the employee’s identity is verified through their signature and/or a personal identification number.
{% enddocs %}
{% docs harvest_invoice_client_key %}


A Harvest Invoice Client Key is an alphanumeric code that you can use to connect to the Harvest Invoice API. With the Client Key, the API can access your account information, including the invoices and payment records associated with it.
{% enddocs %}
{% docs harvest_invoice_number %}


A harvest invoice number is a unique, numerical ID assigned to each invoice generated by the Harvest invoicing system. It is typically used to identify specific invoices in a customer's invoice history.
{% enddocs %}
{% docs harvest_invoice_purchase_order %}


A harvest invoice purchase order is a document that records the purchase of goods or services from a vendor by a buyer. The purchase order will typically include the item(s) being purchased, the quantities and prices, shipping instructions, and payment terms. The harvest invoice purchase order is sent to the vendor and serves as an authorization to purchase the item(s). It also provides the buyer with an itemized record of what they have purchased and the terms of the transaction.
{% enddocs %}
{% docs harvest_invoice_state %}


A harvest invoice state is a digital record of the financial transactions between a supplier and a customer. It typically records the details of the sale, including the amount due, the payment method and due date and any tax or other charges associated with the transaction.
{% enddocs %}
{% docs harvest_invoice_notes %}


Harvest invoice notes are custom messages that appear at the bottom of a Harvest invoice that inform customers about payment terms, thank them for their business, or include any other messages you want to send. The notes can be formatted with HTML and feature any text, images, or links you'd like.
{% enddocs %}
{% docs harvest_invoice_subject %}


The harvest invoice subject is typically the title of the invoice that is sent to a customer by a business. This title usually includes information such as the company name, invoice number, date of issue, and total amount due.
{% enddocs %}
{% docs harvest_invoice_currency %}


Harvest Invoice Currency is the the currency of the invoice being issued by Harvest. This could be any currency of the world, such as US Dollars, Euros, Pounds Sterling, Russian Rubles, and so on.
{% enddocs %}
{% docs harvest_invoice_payment_term %}


Harvest invoice payment terms typically range from 14 to 30 days, depending on the specific agreement between the customer and the vendor.
{% enddocs %}
{% docs harvest_invoice_amount %}


Harvest invoice amount is the total amount an invoice will ask a customer to pay for a product or service. This amount can include taxes, fees, and other charges that may have been added on.
{% enddocs %}
{% docs harvest_invoice_due_amount %}


The amount due for a harvest invoice will depend on the specific invoice that you are looking at, as the amount due will be based on the invoice total and any payments or credits that have been applied to the invoice.
{% enddocs %}
{% docs harvest_invoice_discount_amount %}


Harvest invoice discount amount is the amount by which the amount of an invoice is discounted by a business. This kind of discount is usually offered when the business is paid promptly, usually within a specified time period after the invoice is issued.
{% enddocs %}
{% docs harvest_invoice_discount %}


Harvest Invoice Discounting is a financial service offered by Harvest, which allows businesses to receive accelerated payments for outstanding customer invoices. It works by selling clients’ invoices to a third-party Financial Institution at a discounted rate in exchange for an immediate payment. This provides businesses with the cash injection they need to invest in growth, and it helps to improve their cash flow.
{% enddocs %}
{% docs harvest_invoice_tax_amount %}


The amount of harvest invoice tax varies depending on the jurisdiction. In the United States, the amount of harvest invoice tax or any other type of sales tax is set by each individual state. The amount of tax is typically a percentage of the total sale amount, and ranges from 0% to as high as 10% or more, depending on the state.
{% enddocs %}
{% docs harvest_invoice_tax %}


Harvest invoice tax is a form of sales tax imposed by some states and local governments on purchased items or services. It is imposed upon a purchaser at the time of purchase and is generally collected by the seller. This tax is applicable to products or services purchased for business purposes.
{% enddocs %}
{% docs harvest_invoice_period_start %}


The starting date of the harvest invoice period is the day when the harvest season begins. This typically coincides with the start of the planting season or the date when farmers begin planting their crops.
{% enddocs %}
{% docs harvest_invoice_period_end %}


A harvest invoice period end is the date when an invoice period ends. This is when all outstanding fees are due and all overpayments are refunded. It is also the period-end cutoff for any new invoices and any adjustments or corrections that need to be made.
{% enddocs %}
{% docs harvest_invoice_paid_date %}


The harvest invoice paid date will vary depending on the payment method selected by the customer. If paying by credit card, it will usually be the same day the invoice is generated. If the customer chooses to pay by check, the harvest invoice paid date will usually be 1-2 days after the check is received.
{% enddocs %}
{% docs harvest_invoice_issue_date %}


The harvest invoice issue date is the date on which the invoice was issued by the company.
{% enddocs %}
{% docs harvest_invoice_due_date %}


The invoice due date for harvest varies depending on the specific agreement between the parties involved. Generally, the due date is 30 days from the date of the invoice.
{% enddocs %}
{% docs harvest_invoice_created_at %}


A harvest invoice is a document created by a business after delivering goods or services to a customer. It typically includes information about the goods or services, the total amount due, and the payment terms. Depending on the business, the invoice may also include other information such as taxes and shipping charges.
{% enddocs %}
{% docs harvest_invoice_sent_at %}


A Harvest Invoice is typically sent out when a payment is due from a customer and some or all of the products have been delivered. The invoice may detail the amounts billed, discounts and taxes applied, as well as payment terms and contact information.
{% enddocs %}
{% docs harvest_invoice_paid_at %}


Harvest invoice paid is typically paid through a credit card, debit card, ACH/bank transfer, or PayPal.
{% enddocs %}
{% docs harvest_invoice_updated_at %}


A Harvest Invoice updated at is the date when a Harvest user last modified an invoice. The updated at date is located on the first page of the invoice under the header information.
{% enddocs %}
{% docs harvest_project_pk %}


Harvest Project PK is a joint effort between the University of British Columbia (UBC) and the Pakistan government to actively engage the citizens of Pakistan in the development of new technologies to increase agricultural productivity. Through this project, UBC researchers provide technical training and support to local farmers, as well as introducing innovative farming practices that leverage digital technology, such as precision agriculture, mechanization, and agroecology. The ultimate goal of this initiative is to increase crop yields, promote better nutrition and health, and provide economic stability and prosperity.
{% enddocs %}
{% docs harvest_client_fk %}


Harvest Client Foreign Keys are fields in Harvest (time tracking software) that are used to link to records in another system, such as Harvest Clients. They help Harvest identify which records in another system belong to which Harvest Client.
{% enddocs %}
{% docs harvest_project_name %}


The name of the Harvest project would depend on what specific project is being discussed. Typically, projects related to agriculture and food production are referred to as "harvesting projects," as they involve collecting or gathering crops. Otherwise, it could vary depending on the context.
{% enddocs %}
{% docs harvest_project_code %}


The Harvest Project Code is an open source software project created by Harvest.org, designed to help communities and organizations manage their finances, track donations, and create reports. It is designed to be user-friendly and can be downloaded for free from the official website.
{% enddocs %}
{% docs harvest_project_notes %}


Harvest Project Notes is a service that enables teams to capture, organize, and share project updates, ideas, tasks, and more. It facilitates real-time collaboration between team members, and allows them to easily review and comment on notes in a centralized location. It also provides access control and version history so users can review and edit notes without fear of losing data. Harvest Project Notes also helps teams stay organized and on task, with features such as task lists, due dates, data export and integration tools.
{% enddocs %}
{% docs harvest_project_bill_by %}


The Harvest Project is funded by public and private donations, including grants from the Gates Foundation, Microsoft, Procter and Gamble, individual donors, corporate sponsors, and government investments.
{% enddocs %}
{% docs harvest_project_budget_by %}


The budget for a harvest project largely depends on the size, scope, and complexity of the project. Budgets for harvest projects can range from small-scale projects that cost only a few hundred dollars to larger-scale projects that may cost up to six figures. Other factors influencing the budget for a harvest project include the type of technology, number of workers needed for the project, and any additional resources that may be needed.
{% enddocs %}
{% docs harvest_project_hourly_rate %}


The hourly rate for the Harvest Project depends on the particular job. Generally, wages for laborers employed by this project start around the minimum wage and can range up to $13.55 per hour.
{% enddocs %}
{% docs harvest_project_cost_budget %}


The cost of a harvest project will depend on several factors, including the size of the project, the type of work being done, and the labor and materials needed to complete the project. There is no one-size-fits-all answer, as each project is unique. An experienced harvest project consultant or contractor can help determine the budget for a specific project.
{% enddocs %}
{% docs harvest_project_fee %}


Harvest project fee is a fee that is charged when you use the Harvest project management and accounting software. This fee helps to cover the costs associated with providing the platform, such as customer support, server maintenance, and software updates.
{% enddocs %}
{% docs harvest_project_budget %}


The budget for a harvest project will depend on several factors such as the size and scope of the project, labor costs, materials, and any equipment needed. It is best to consult with a professional to determine the budget for a specific harvest project.
{% enddocs %}
{% docs harvest_project_over_budget_notification_percentage %}


The exact percentage of over-budget notification for a harvest project will depend upon the specific project and client requirements. Generally, most project budgets contain a line item for an over-budget notification threshold that is set by the customer. This threshold is typically a percentage of the allocated budget, and is typically between 5% and 10%. This is applied to any cost overruns, and once the threshold is reached a notification is generated to inform the customer.
{% enddocs %}
{% docs harvest_project_show_budget_to_all %}


A Harvest Project Show Budget is an itemized list of the costs associated with an event, project, or production. It typically includes detailed descriptions of the items or services to be purchased, the estimated cost of each item, and the total cost. It can provide an overview of what has been budgeted for each expenditure and may include line item estimates for projects, equipment, and materials. The budget may also include personnel costs and other related expenses.
{% enddocs %}
{% docs harvest_project_cost_budget_include_expenses %}


Harvest project cost budget expenses can include costs related to the project’s labor, materials, equipment and other services needed to complete the project, as well as any other operating and administrative expenses that are necessary to complete the project. Expenses could also include project promotion or advertising, project training, conference attendance or expenses related to research.
{% enddocs %}
{% docs harvest_project_budget_is_monthly %}


The budget for a harvest project will vary depending on the scale and scope of the project. For example, a large agricultural harvest project may require more staff and equipment than a small home garden harvest project. A good rule of thumb is to budget approximately 10-20% of your total project cost for the month, depending on the size of the project and the resources required.
{% enddocs %}
{% docs harvest_project_notify_when_over_budget %}


Harvest Project Notify is an automated email alert that is sent out when any project surpasses its budget.  The alert is sent to the project manager, or other designated personnel, to quickly identify and take the necessary actions to prevent the project from exceeding the pre-set budget.
{% enddocs %}
{% docs harvest_project_is_billable %}


The Harvest Project is a not-for-profit organization dedicated to helping people in need. While it may be possible for Harvest Project to charge for its services, it is not a billable organization.
{% enddocs %}
{% docs harvest_project_is_fixed_fee %}


Harvest Project is a fixed fee project management platform that helps businesses create, manage, and track projects more efficiently. It allows users to create projects and assign tasks to team members, set a budget and payment terms, set milestones and due dates, and monitor progress. It also offers core project management features such as invoicing and integrated time tracking, as well as timeline and resource management.
{% enddocs %}
{% docs harvest_project_is_active %}


Yes, the Harvest Project is an active project that aims to bring fresh, local food to low-income and under-resourced communities around the world. The Harvest Project works with partners to provide local farmers with support and access to training, create community kitchens, and delivery services to get food to people in need.
{% enddocs %}
{% docs harvest_project_over_budget_notification_date %}


The exact date for a harvest project over budget notification will depend on the specifics of the project. Generally speaking, it should be sent as soon as the project manager or team leader becomes aware of an over budget situation.
{% enddocs %}
{% docs harvest_project_created_at %}


Harvest Project was created at Bandwidth.com.
{% enddocs %}
{% docs harvest_project_ends_on %}


The Harvest Project typically runs from October to March. Depending on the specific program, the exact end date may vary.
{% enddocs %}
{% docs harvest_project_updated_at %}


The Harvest Project was last updated on February 18, 2021.
{% enddocs %}
{% docs harvest_project_starts_on %}


The Harvest Project starts on October 1st with the harvest of maize, soy, and wheat.
{% enddocs %}
{% docs jira_field_pk %}


Jira Field PK is a unique identifier assigned to each project and field entry in Jira, used to differentiate projects and fields from one another. It is a 32-character hexadecimal string. It is important to note that Jira Field PKs are unique and are not intended to be used to identifying specific values.
{% enddocs %}
{% docs jira_field_name %}


In Jira, the field name is the specific name assigned to each Jira issue field or form field that is used to capture data associated with an issue. Examples of Jira field names include Issue Type, Priority, Summary, Description, etc.
{% enddocs %}
{% docs jira_field_is_array %}


Jira fields is an array is a data structure that stores multiple values within a single field. This allows users to store multiple values in a single field and access them easily. It is commonly used to store associated data related to a field, such as product options or drop-down menus.
{% enddocs %}
{% docs jira_field_is_custom %}


The Jira Field Custom feature is a feature within Jira that allows users to create their own custom fields and make them available on the create, edit and transition screens. This capability allows users to track additional data points that are relevant to their individual project. This data can be used to filter, sort, and analyze tickets.
{% enddocs %}
{% docs person_pk %}


Person PK (person primary key) is a unique identifier assigned to a person in a database that is used to differentiate them from other people in the database. Person PK is usually created by combining personal information such as name, date of birth, gender, and other demographic information.
{% enddocs %}
{% docs jira_user_fk %}


A Jira user foreign key is a unique identifier for each Jira user that links that user to their associated records in the Jira database. The foreign key is stored as a field in the Jira user table and is used to reference the user when creating or editing records in other tables in the Jira database.
{% enddocs %}
{% docs harvest_employee_fk %}


A harvest employee foreign key is a type of foreign key found in a relational database management system (RDBMS), which connects a table of harvest employees to the parent table of harvest records. It is usually a unique identifier, such as an ID number, that is used to ensure that each row of the employee table is linked to the appropriate harvest record. The primary purpose of the foreign key is to make sure that any changes made to the employee table are reflected in the corresponding harvest record, preventing data inconsistency or incorrect entries.
{% enddocs %}
{% docs jira_issue_sprint_bridge_pk %}


Jira Issue Sprint Bridge PK is a plugin used to map issues from Jira to sprints. It allows users to manage sprints and issues associated with them in a more organized manner. It simplifies the task of assigning tasks to sprints by providing an interface for quickly associating issues with sprints. Further, it enables more flexible sprint management by providing a method for assigning issues to more than one sprint.
{% enddocs %}
{% docs jira_issue_pk %}


JIRA Issue PK stands for JIRA Issue Primary Key. It is a unique identifier for each issue or ticket created in a JIRA system. This primary key is often used to refer to individual issues as well as tracking their progress.
{% enddocs %}
{% docs jira_sprint_fk %}


A Jira sprint foreign key is a unique identifier that is used to connect the details of a sprint to the details of the related Issuetype or Epic in Jira. The sprint foreign key can be used to filter sprints, assign sprints to projects, or add additional sprints to an existing project.
{% enddocs %}
{% docs harvest_client_pk %}


Harvest Client PK (also known as Harvest Public Key) is a unique, public cryptographic key/token used to authenticate a client to the Harvest API. It is issued by the Harvest application when a new project is created, and can be found in the "Credentials" page.
{% enddocs %}
{% docs harvest_client_currency %}


Harvest Client Currency is a feature of the Harvest invoice system. It allows organizations to define a currency other than their home currency, and use it for invoicing and payments. Harvest Client Currency is a great tool for freelancers and digital nomads who often need to bill internationally, in local currencies, without having to exchange money themselves.
{% enddocs %}
{% docs harvest_client_name %}


Harvest Client is an online time tracking and invoicing tool. Its official name is Harvest.
{% enddocs %}
{% docs harvest_client_is_active %}


Harvest Client is an online time tracking and invoicing service that allows teams to track time, manage budgets, invoice clients, and collaborate on projects. It is an active service that is used by thousands of teams around the world.
{% enddocs %}
{% docs harvest_client_created_at_ts %}


Harvest Client is a software development company based in London. They specialize in creating custom software for businesses. They specialize in full stack development, web application development, mobile app development, big data, artificial intelligence, and machine learning.
{% enddocs %}
{% docs harvest_client_updated_at_ts %}


Harvest Client (formerly known as Tick) is a time tracking, billing, and online invoicing software that helps people track time for projects and time sheets. It was first released in 2006 and is now updated regularly with new features and improvements. The most recent version of Harvest Client was released on June 24th, 2020.
{% enddocs %}
{% docs jira_issue_board_bridge_pk %}


Jira Issue Board Bridge PK is an add-on for Jira Software which enables users to view and manage Jira issues directly from boards. With the Bridge, users can create sprints, backlogs, and boards, as well as drag-and-drop issues. This add-on helps teams quickly identify changes, create filters for organization, and manage sprints for better results. It also facilitates better collaboration between teams, allowing users to easily track the progress of tasks.
{% enddocs %}
{% docs jira_issue_pk %}


Jira Issue PK is a unique identifier for an issue created in Atlassian's Jira Software. It is composed of the project key and the issue number.
{% enddocs %}
{% docs jira_board_fk %}


A Jira board foreign key is a unique identifier that connects a Jira board to an associated database table. It functions similarly to a primary key in that it uniquely identifies a record associated with the board, and no two board records can have the same key. The foreign key also allows records associated with the board to be linked, retrieved, and updated more easily.
{% enddocs %}
{% docs harvest_expense_pk %}


Harvest Expense PK is an expense tracking and accounting tool designed for small businesses and teams. It is a web-based tool that simplifies the tracking, management, and reporting of employee expenses, including salary and business expenses. With Harvest Expense PK, users can quickly categorize and store expenses, create reports, and track spending trends. It also provides automated invoice creation and reminders, saving time and money.
{% enddocs %}
{% docs harvest_client_fk %}


A harvest client foreign key is an alphanumeric string assigned to each client within the Harvest software. This string acts as an identifier that helps to facilitate communication between the Harvest software and any other integrated software or systems. The foreign key is required for some API calls, as well as for integrations with other services.
{% enddocs %}
{% docs harvest_invoice_fk %}


A harvest invoice foreign key is a unique identifier that links an invoice in Harvest, an online invoicing and tracking service, to a particular project or task. It is used to track a project's progress and to ensure that all invoices related to the project are properly linked.
{% enddocs %}
{% docs harvest_project_fk %}


A foreign key in a Harvest Project is a unique identifier or key that links or relates data in two separate tables. It is a reference to the primary key of another table, which allows the two tables to be connected. This is useful for linking related pieces of data from different tables and allowing data to be shared across multiple tables.
{% enddocs %}
{% docs harvest_employee_fk %}


A harvest employee foreign key is a field in a database table that is used to link two tables together. It stores a reference to a primary key in the foreign table, thereby allowing the two tables to be linked and related data to be retrieved.
{% enddocs %}
{% docs harvest_expense_category_natural_key %}


The natural key for a harvest expense category is the unique identifier assigned to each category by the user or business. This may be in the form of a code, number, or combination of words or letters.
{% enddocs %}
{% docs harvest_employee_assignment_natural_key %}


A harvest employee assignment natural key is a unique combination of attributes that identify an individual employee, such as employee ID, employee name, and employer name, used to identify the employee in a database or system.
{% enddocs %}
{% docs harvest_expense_notes %}


Harvest expense notes are notes used to record expenses that are related to the preparation of a crop for sale. These notes can be used to track expenses such as seed, fertilizer, water, labor costs, and more. They can also be used to help with budgeting, since the notes will record all of the expenses associated with a crop.
{% enddocs %}
{% docs harvest_expense_receipt_file_name %}


The harvest expense receipt file name typically follows a specific pattern such as “YYYYMMDD_HarvestExpenseReceipts_CompanyName.”
{% enddocs %}
{% docs harvest_expense_locked_reason %}


Harvest expense locked reason is when a budget has been set for a certain expense in Harvest, and that budget has been exceeded. The expense is then locked, meaning people will not be able to enter any more expenses under that category until the budget is increased or the expense is transferred to another budget item.
{% enddocs %}
{% docs harvest_expense_receipt_content_type %}


A Harvest Expense Receipt content type is a form of electronic record-keeping used to track and record business expenses. It includes fields such as the item purchased, merchant name, date of purchase, quantity, price, and any applicable tax rate. This type of content type also allows users to attach an image or other documents as proof of purchase. These receipts can then be used to substantiate expenses and can be used for tax purposes.
{% enddocs %}
{% docs harvest_expense_receipt_url %}


There is no standard URL for harvest expense receipts. Each user will need to log in to their Harvest account to access their own individual expense receipts.
{% enddocs %}
{% docs harvest_expense_total_cost %}


The total cost of harvest expenses depends on numerous factors, including the type of crop, the size of the harvest, the method of harvesting, and other labor and material costs. Therefore, it is not possible to provide an exact answer to this question.
{% enddocs %}
{% docs harvest_expense_receipt_file_size %}


The file size of a harvest expense receipt depends on the type of file format that is used, such as PDF, JPEG, or PNG. The size of a PDF file is typically much smaller than that of a JPEG or PNG file. Generally speaking, a harvest expense receipt file size can range from a few kilobytes to several megabytes.
{% enddocs %}
{% docs harvest_expense_units %}


Harvest expense units refer to a method of tracking income and expenses, where each line item is counted as an expense unit. This allows a business to track individual costs, assigning percentages of the total cost to each specific item. It also provides a convenient way to compare the expense of one project to another.
{% enddocs %}
{% docs harvest_expense_is_closed %}


Harvest expense closing is the process of reconciling your accounts after the end of a financial period. It ensures that all transactions and activities related to your expenses are properly accounted for. In particular, it involves reviewing your spend categories to make sure that expenses are properly classified and that all expenses incurred during the period have been fully accounted for.
{% enddocs %}
{% docs harvest_expense_billable %}


Harvest Expense Billable is a type of invoice that is used when a company pays an outside contractor or freelancer for services rendered. This invoice usually includes the name of the contractor, a description of the services provided, the total amount due, and any applicable taxes. The invoice may also include specific payment terms, such as when payment is due, or whether any additional expenses may be charged. By making the payment billable, contractors are also provided with a record of payment that can be used for tax purposes.
{% enddocs %}
{% docs harvest_expense_is_billed %}


Harvest expense is the cost of labor for harvesting and preparing crops for market. It includes payments to workers for the actual time and cost of harvesting, as well as any other costs associated with the labor such as equipment, materials, and associated overhead. It is generally billed to the buyer of the product as part of the overall cost of the crop.
{% enddocs %}
{% docs harvest_expense_is_locked %}


Harvest expense lock is a feature in the Harvest financial management software. It allows you to set an amount that can't be exceeded for a particular expense type. This helps ensure that the expenses associated with a project or team stay within the budgets that have been set.
{% enddocs %}
{% docs harvest_expense_created_at %}


Harvest Expense is a web-based service created by Harvest, Inc., in 2011. The service is designed to help businesses of any size track and manage invoice payments, accounts receivable, and other financial transactions. The service also provides reports, data visualization, and a payments portal for easy expense tracking. The service is available for both Android and iOS devices.
{% enddocs %}
{% docs harvest_expense_updated_at %}


The exact amount of harvest expense will depend on the specific kind of crop being harvested and the costs associated with the harvesting process. It is best to contact your local agricultural extension office or a local farm advisor for the most up-to-date information on harvest expenses.
{% enddocs %}
{% docs harvest_expense_spent_date %}


Harvest expense spent dates depend on the type of harvest and the region in which it is taking place. In many cases, the date of the harvest expenses are determined prior to the start of the season, based on when the crop is expected to be ready for harvest. The exact dates are often dependent on weather and other factors.
{% enddocs %}
{% docs jira_sprint_pk %}


Jira Sprint PK is an add-on to the popular project tracking tool Jira. This add-on provides essential features such as sprint planning, estimation and visual tracking, kanban boards and a variety of reports. It helps teams align on sprint goals, visualize work in progress, and collaborate more effectively.
{% enddocs %}
{% docs jira_project_fk %}


Jira Project foreign key is an external unique identifier that can be used to link together project data from multiple Jira projects. This enables the creation of custom reports and analytic tools to pull in data from a number of different projects.
{% enddocs %}
{% docs jira_sprint_name %}


A Jira sprint name is an arbitrary name given to a particular Jira sprint. For example, you could name a sprint 'Sprint 1' or 'UI Improvements'. It is up to the team creating the sprint to decide how to name it.
{% enddocs %}
{% docs jira_sprint_goal %}


Jira Sprint Goal is a goal that team members commit to accomplishing during a sprint. It should be specific, measurable, attainable, relevant, and time-bound. By creating a Sprint Goal, the team has a clear sense of direction, which helps them focus, prioritize, and collaborate better.
{% enddocs %}
{% docs jira_sprint_state %}


In Jira, the Sprint Status indicates the health and progress of a sprint. There are four main states: Active, Complete, Closed, and Future. The Active state is used when a sprint is currently being worked on. The Complete state is used when all tasks in the sprint have been completed. The Closed state is used when all tasks are done and the sprint has been officially closed. The Future state is used for sprints that have been scheduled for the future, but have not yet been started.
{% enddocs %}
{% docs jira_start_at_date %}


The JIRA Start Date is the day that a JIRA project or task starts. This field can be found in the Details section of the JIRA task and it is used to track the start date of the project or task.
{% enddocs %}
{% docs jira_complete_at_date %}


Jira is an issue, project, and task tracking platform designed to help teams collaborate, plan, and track the progress of a project. It is a cloud-based application used for agile project management and issue tracking and can be utilized to enable an efficient workflow across multiple teams, organizations, and products. Jira includes features such as reporting, roadmaps, timelines, and visibility dashboards, as well as integration with other tools and products, making it a comprehensive tool for project tracking. As of October 2020, Jira is one of the most popular bug-tracking and project management tools on the market.
{% enddocs %}
{% docs jira_end_at_date %}


Jira does not have an end date; it is a continuous, ongoing application.
{% enddocs %}
{% docs harvest_timesheet_pk %}


Harvest Timesheet PK is an online time tracking and invoicing platform that helps businesses and freelancers track time, manage projects, and create invoices. It allows users to track the time spent on projects and tasks, create detailed project reports, and set up automatic time-tracking reminders. It also includes invoicing capabilities, allowing users to send invoices and receive payments.
{% enddocs %}
{% docs harvest_external_reference_jira_fk %}


Harvest External Reference JIRA foreign key is an external ID field on Harvest Timesheets that is associated with a project, task, person, or other object in JIRA. This allows Harvest Timesheets to tie any Harvest entries with JIRA records in an automated way.
{% enddocs %}
{% docs harvest_task_fk %}


A foreign key in a harvest task is a field that refers to the primary key of the data in another table. These foreign keys are used to join data from one table to another and create a relationship between the two. This type of referencing provides a way to ensure data consistency and integrity.
{% enddocs %}
{% docs harvest_project_fk %}


A foreign key in the Harvest Project is a column, or set of columns, in a table that references the primary key of another table. It creates a link between two related tables and ensures the validity of the data. It helps define the relationship between the tables and makes sure the data stays consistent and accurate.
{% enddocs %}
{% docs harvest_external_reference_jira_issue_key %}


A Harvest External Reference Jira Issue Key is a unique identifier associated with a project or issue referenced in Harvest. These keys are typically used to link Harvest tasks and stories to corresponding Jira tickets.
{% enddocs %}
{% docs harvest_timesheet_natural_key %}


The natural key for Harvest Timesheet is the unique ID assigned to each timesheet. This number is generated when the timesheet is first created.
{% enddocs %}
{% docs harvest_employee_natural_key %}


A harvest employee natural key is a unique identifier associated with each employee, typically derived from a common value such as an employee ID number or Social Security Number. This key helps link related data entries across different systems and databases, facilitating accurate data analysis.
{% enddocs %}
{% docs harvest_task_assignment_natural_key %}


A harvest task assignment natural key is an identifier associated with a harvesting task, such as a specific crop or location, that is used to link the task with related activities, such as harvesters, production and logging. It is a method of tying related tasks together.
{% enddocs %}
{% docs harvest_employee_assignment_natural_key %}


A harvest employee assignment natural key is a unique identifier used to differentiate individual employee assignments within a particular harvest workload. This may include a combination of variables such as the employee’s name, the crop they are assigned to, and the harvest season they are assigned to work.
{% enddocs %}
{% docs harvest_invoice_natural_key %}


A harvest invoice natural key is an unique identifier for an invoice that is generated by the harvest invoicing system, such as a combination of a unique string of numbers, letters, and/or symbols.
{% enddocs %}
{% docs harvest_client_natural_key %}


Harvest Client natural key is a guaranteed unique reference to identify a harvest client within the application. It is a combination of either the client's name, ID, or any external reference. This key is used to match data between Harvest and other applications, allowing the data to be updated or shared with those applications.
{% enddocs %}
{% docs harvest_timesheet_notes %}


Harvest Timesheet Notes are notes that employees can add to their timesheet in Harvest, a popular time-tracking software. They allow employees to include additional context to explain how and when they worked, and why they logged the hours they did. Notes also help their manager understand the hours added to their timesheet.
{% enddocs %}
{% docs harvest_timesheet_locked_reason %}


Harvest Timesheet Locked Reason is a security feature that prevents users from changing logged time. When locked, the time data is securely stored and cannot be edited. This is often used in a professional environment to ensure accuracy and accountability in employee time tracking.
{% enddocs %}
{% docs harvest_timesheet_billable_rate %}


The billable rate for Harvest Timesheet will vary depending on your needs and the services you require. Generally, the cost of Harvest Timesheet is based on the number of users, the storage required, and additional customization you request. Please contact Harvest Timesheet support for more information about exact billing rates.
{% enddocs %}
{% docs harvest_timesheet_cost_rate %}


Harvest's pricing plans are based on the number of users and the features you need. Prices range from $12/month for a single user, to $99/month for up to five users, to enterprise plans. The cost rate of each plan varies depending on how much access and functionality you need.
{% enddocs %}
{% docs harvest_timesheet_hours %}


Harvest TimeSheet Hours is an online time-tracking platform that helps businesses track the time their employees spend working on specific tasks. The platform allows employers and employees to easily submit their hours in real time for accurate tracking and reporting. With Harvest TimeSheet Hours, employers can identify gaps in productivity, improve performance, and manage costs.
{% enddocs %}
{% docs harvest_timesheet_hours_budgeted %}


There is no single answer to this question, as the amount of hours budgeted for a harvest timesheet will vary depending on the company and project. Generally, a company will budget for the amount of time necessary to complete the task, taking into account factors such as complexity of the task, the number of people involved in the project, and the availability of resources.
{% enddocs %}
{% docs harvest_timesheet_is_billable %}


Harvest Timesheet is not billable as it is a web-based time tracking and invoicing service that allow you to track time spent on projects, helping you optimize and streamline payment processes.
{% enddocs %}
{% docs harvest_timesheet_is_closed %}


Harvest Timesheets Closed is a feature of the Harvest web-based timesheet software that allows users to close their timesheets for the week and prevent new entries for the week, making it easier for managers to review and approve. This feature is useful for timesheet accuracy, as it allows users to review and edit their entries before submission.
{% enddocs %}
{% docs harvest_timesheet_is_running %}


Harvest Timesheet is a web-based time tracking software for individuals and teams to easily track time spent on projects, tasks, and clients. It allows businesses to manage, report, and invoice time efficiently and accurately, helping businesses save time and money.
{% enddocs %}
{% docs harvest_timesheet_is_billed %}


Harvest Timesheet is billed as a monthly subscription, with prices starting at $12 per month (per user). There is also an additional cost for features like time tracking and invoicing.
{% enddocs %}
{% docs harvest_timesheet_is_locked %}


Harvest Timesheet Locked is an automated status assigned in certain circumstances within Harvest. When a timesheet is locked, the employee’s hours are absent from the Payroll Reports and the timesheet cannot be edited by the user. Generally, this happens when a timesheet is either manually locked or when the timesheet has been automatically locked due to a predetermined wait time set by the employer (this can range from 1-7 days). Locked timesheets must be manually unlocked before the hours can be altered or approved.
{% enddocs %}
{% docs harvest_timesheet_created_at_ts %}


Harvest Timesheet is a web-based timesheet and invoicing application created by Harvest, Inc. It is designed to help small businesses and freelancers track time, assign tasks, create invoices and manage projects. Harvest Timesheet also includes integration with many popular applications, including Dropbox, Google Docs, Github, Basecamp, and more.
{% enddocs %}
{% docs harvest_timesheet_timer_started_at_ts %}


Harvest Timesheet Timer (usually referred to as just Harvest) is a time tracking platform for freelance professionals and businesses. The app is designed to make tracking time easier, helping you keep projects on track, communicate financial information, and make team collaboration easier. The Ts (timestamps) associated with Harvest Timesheet Timer allow you to track when each task has begun and ended, as well as when to file project reports. The Ts can also provide basic analytics, such as how many hours are allocated to each task.
{% enddocs %}
{% docs harvest_timesheet_started_at %}


Harvest Timesheet can be started from the Harvest website (https://www.getharvest.com/timesheets).
{% enddocs %}
{% docs harvest_timesheet_updated_at_ts %}


Harvest Timesheet is an online time-tracking and project management solution. It provides support for logging time accurately as well as tracking task timelines. It also provides powerful analytics features, allowing users to generate reports, analyze data and measure performance. The timesheet is updated on a daily basis and can be accessed from anywhere at any time.
{% enddocs %}
{% docs harvest_timesheet_spent_at_ts %}

Harvest Timesheet spent at TS is a time tracking, online invoicing and project management app that helps teams work collaboratively and optimally. It enables managers to easily track employee time and expenses, create detailed reports, and forecast project progress and budget status. Harvest Timesheet also offers a comprehensive set of tools for managing clients and projects.
{% enddocs %}
{% docs harvest_external_reference_permalink %}


Harvest External Reference Permalinks are unique URL links to a specific line item on a Harvest Invoice. These links can be copied and sent with email or shared on social media and provide customers with an easy way to access an invoice or estimate without needing to log into their Harvest account.
{% enddocs %}
{% docs harvest_external_reference_platform %}


The Harvest External Reference Platform (HARP) is a technology platform developed by Harvest Infrastructure Technologies that enables businesses to share electrical and natural gas data, providing aggregated energy data to the energy industry through a standardized format. HARP makes energy data available to energy users, utilities and service providers to more efficiently manage energy costs and to better serve their customers. HARP also enables users to easily and securely connect and collaborate with any device, system or service to create an ecosystem of interoperable energy data that can be accessed from anywhere.
{% enddocs %}
{% docs sprint_pk %}


Sprint PK (previously known as Sprint Customer Relationship Management) is a cloud-based, integrated customer relationship management (CRM) application suite designed and developed by South African software provider Sprint. The suite is designed to help businesses to grow and better serve their customers through improved sales, marketing and customer service automation. It enables businesses to easily track and manage their customer interactions, manage campaigns, and build relationships. It also helps organizations to increase their online presence. Sprint PK comes with a comprehensive list of features that enable businesses to improve their workflow efficiency and create a better customer experience.
{% enddocs %}
{% docs jira_sprint_fk %}


A Jira sprint foreign key is a unique key that identifies a sprint in a Jira project. This key can be used to link sprints between projects, allowing teams to better coordinate and track progress.
{% enddocs %}
{% docs harvest_project_fk %}


A foreign key in a Harvest Project is an attribute in one table (the child) that references the primary key in another table (the parent). This allows you to link data between related tables and create relationships between them.
{% enddocs %}
{% docs jira_epic_pk %}


Jira Epic PK is an automated process in Jira, an issue tracking and project management software, that assigns a unique number to every Epic created in a Jira project. The PK (Primary Key) is a number that is used to differentiate each Epic. Any tasks related to the Epic will carry the same Epic PK. This makes it easy to track progress on related tasks and Epics.
{% enddocs %}
{% docs jira_epic_name %}


In Jira, an epic is a large initiative or body of work that is divided into a number of smaller tasks known as issues, stories, or initiatives. Epic names are used to group related issues and stories to provide an overall goal, objective, or purpose for the work being completed.
{% enddocs %}
{% docs jira_epic_summary %}


A Jira Epic Summary is a brief summary of a Jira Epic, which is a larger issue type used to group multiple related individual tasks and stories. They provide a high-level overview of the epic and allow for progress tracking across multiple work items.
{% enddocs %}
{% docs jira_epic_is_done %}


A Jira Epic is a large, high-level task that is made up of multiple individual stories or tasks. It is done when all the component tasks and stories have been completed and verified.
{% enddocs %}
{% docs jira_epic_key %}


A Jira Epic Key is a unique ID assigned to each Epic created in Jira, which is used to track and track the progress of related issues in the project. It is typically visible in the epic's summary and can be used to search for, link to, and reference the epic.
{% enddocs %}
{% docs jira_issue_summary_pk %}


JIRA Issue Summary PK, or primary key, is a unique identifier that is associated to each JIRA issue and is always created when a JIRA issue is first created. It helps people identify each specific issue and can be used to identify changes or progress related to a single issue.
{% enddocs %}
{% docs jira_issue_duration %}


Jira Issue Duration is a period of time between when an issue is first reported, to when it is completed (marked as resolved). This includes the time spent investigating and resolving the issue as well as any other follow up needed by any third parties, such as customers or vendors. It can be used to measure the efficiency of the team in resolving issues, as well as to identify any potential delays in issue resolution.
{% enddocs %}
{% docs jira_issue_age_in_days %}


Jira issue age in days is the number of days from the issue's creation until its closure.
{% enddocs %}
{% docs jira_issue_summary_story_point_estimate %}


Jira issue summary and story point estimates are two different measurement concepts. Jira issue summary is a brief summary of the issue that provides a summary of the problem, who is affected, and any other relevant information. Story point estimate is a tool used to quantify the complexity, effort, and risk associated with an issue. It could range from one signifying a very small, simple task to larger numbers for tasks that require more effort or complexity.
{% enddocs %}
{% docs jira_issue_development_stage %}


Jira issue development stages represent the different phases of a project or issue as it progresses from conception to completion. In Jira, these stages are managed using issue life cycles, which define the workflow and issues types that a project goes through as it is developed. Common issue development stages include To Do, Open, In Progress, Done, Reopened, Closed, and Cancelled.
{% enddocs %}
{% docs jira_issue_pk %}


Jira Issue PK is a unique identifier that is assigned to each Jira Issue and helps identify it within the Jira system. The identifier is generated by Jira and consists of a random number.
{% enddocs %}
{% docs jira_issue_parent_fk %}


Jira issue parent foreign key is a field that identifies the parent of an issue in Jira. It holds a reference to the Jira ID of the parent issue, in order to indicate which issue is the parent of a given issue.
{% enddocs %}
{% docs jira_user_fk %}


A Jira user foreign key is a reference to a record in the user table that is used to identify the Jira user for a record stored in another table. In a relational database, foreign keys are values that generally reference a primary key in another table. This enables the database to establish and maintain relationships between tables. In Jira, the user foreign key is referred to as the username, and it is unique for every user within the system.
{% enddocs %}
{% docs jira_creator_fk %}
