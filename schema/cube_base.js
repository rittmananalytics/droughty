cube (`wh_delivery__harvest_expenses_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_expenses_fact`,
dimensions: {
harvest_expense_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_expense_pk`,
  description: `Harvest expense pk is an accounting software designed to help businesses automate their expense tracking, create detailed budgeting reports, and provide detailed financial reporting. It integrates with popular accounting software, such as QuickBooks and Xero, to offer a comprehensive solution for businesses of all sizes.`,
} ,
harvest_client_fk:  {
  sql: `harvest_client_fk`,
  type: `string`,
  description: `A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data.`,
} ,
harvest_invoice_fk:  {
  sql: `harvest_invoice_fk`,
  type: `string`,
  description: `A harvest invoice foreign key is a field in a database table that links or references a row or record in another table. It is made up of the primary key from one table and is used as the foreign key in another table. The purpose of a foreign key is to ensure data integrity and establish relationships between tables.`,
} ,
harvest_project_fk:  {
  sql: `harvest_project_fk`,
  type: `string`,
  description: `A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship.`,
} ,
harvest_employee_fk:  {
  sql: `harvest_employee_fk`,
  type: `string`,
  description: `A harvest employee foreign key is a field in a database table that is used to uniquely identify a particular record or row in another table. This is known as a foreign key because it relates to the primary key of another table, usually located in a different database.`,
} ,
harvest_expense_notes:  {
  sql: `harvest_expense_notes`,
  type: `string`,
  description: `Harvest Expense Notes is a feature of the Harvest time tracking service that allows users to create, track, and manage their business expenses. With Harvest Expense Notes, users can easily upload receipts associated with their expenses and have them recorded and tracked in the Harvest system. They can also assign those expenses to the correct task, project, and/or client, making it easy to report on business expenses and their associated costs.`,
} ,
harvest_expense_receipt_file_name:  {
  sql: `harvest_expense_receipt_file_name`,
  type: `string`,
  description: `The harvest expense receipt file name typically follows the format \"YYYYMMDD_harvest_receipts.xxx\" (i.e., the year, month, and day of the harvest, followed by the words \"harvest_receipts\"), with the \".xxx\" suffix depending on the file format being used (e.g., \".pdf\", \".docx\", \".xls\", etc.).`,
} ,
harvest_expense_locked_reason:  {
  sql: `harvest_expense_locked_reason`,
  type: `string`,
  description: `Harvest Expense Locked Reason is the reason for which a Harvest expense can be locked. There are several reasons why a Harvest Expense may be locked, such as: a request for a payment against the expense has been made but not yet accepted, someone is asking for an additional review of the expense, or the expense has been marked as disputed by the client or customer.`,
} ,
harvest_expense_receipt_content_type:  {
  sql: `harvest_expense_receipt_content_type`,
  type: `string`,
  description: `Harvest Expense Receipt content type is a content type used by Harvest, an online time-tracking service. This content type gives users a way to store and post receipt images to the system for tracking and reimbursement purposes. Receipts are stored electronically for future retrieval and can be used for reporting or auditing purposes.`,
} ,
harvest_expense_receipt_url:  {
  sql: `harvest_expense_receipt_url`,
  type: `string`,
  description: `Harvest Expense Receipts URL is https://id.getharvest.com/expense-receipts.`,
} ,
harvest_expense_is_closed:  {
  sql: `harvest_expense_is_closed`,
  type: `boolean`,
  description: `Harvest expense is closed when all the expenses related to a specific harvest have been collected and reconciled with the corresponding income. At this point, the harvest expense account can be closed off and put into inactive status.`,
} ,
harvest_expense_billable:  {
  sql: `harvest_expense_billable`,
  type: `boolean`,
  description: `Harvest Expense Billable is a feature within the Harvest time-tracking and invoicing application that enables businesses to quickly track billable expenses for their clients or projects. It enables businesses to streamline their expense tracking and invoicing process, save time, and take full control of their finances.`,
} ,
harvest_expense_is_billed:  {
  sql: `harvest_expense_is_billed`,
  type: `boolean`,
  description: `Harvest expenses are costs that a farmer incurs such as seed, fertilizer, fuel, labor, and other items used to produce a crop.They are typically billed to the farmer after the crop has been harvested and sold, either through a lump-sum invoice or a series of invoices over the course of the season.`,
} ,
harvest_expense_is_locked:  {
  sql: `harvest_expense_is_locked`,
  type: `boolean`,
  description: `Harvest Expense is an expense management feature offered by Harvest, an online accounting and invoicing software. This feature allows businesses to track and manage their expenses, ensuring that all expenses made by the business are compliant with company policies as well as any external regulations. When a Harvest Expense is locked, it means that it can no longer be edited or removed, and the funds for that expense cannot be reclaimed. This ensures that businesses stay compliant and the integrity of their tracking and reporting is maintained.`,
} ,
harvest_expense_created_at:  {
  sql: `harvest_expense_created_at`,
  type: `time`,
  description: `Harvest Expense is a cloud-based software that was created in 2008. It provides businesses automatic invoicing, expense tracking, and time tracking services.`,
} ,
harvest_expense_updated_at:  {
  sql: `harvest_expense_updated_at`,
  type: `time`,
  description: `Harvest expense is updated as needed. It is typically updated when a change in the cost of growing, harvesting, or processing the crop requires a change in the amount spent.`,
} ,
harvest_expense_spent_date:  {
  sql: `harvest_expense_spent_date`,
  type: `time`,
  description: `Harvest expense spend date should be the date associated with the payment transaction for the expenses incurred. It should be the date that the funds were paid out or when the expense was otherwise processed.`,
} ,
}});
cube (`wh_delivery__harvest_invoice_line_items_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoice_line_items_fact`,
dimensions: {
harvest_invoice_line_item_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_invoice_line_item_pk`,
  description: `A Harvest Invoice Line Item PK is a primary key that uniquely identifies each item listed on a Harvest invoice. This primary key is used to access information about each line item on the invoice, including the amount, quantity, and any discounts or other modifiers that may have been applied to the line item.`,
} ,
harvest_project_fk:  {
  sql: `harvest_project_fk`,
  type: `string`,
  description: `A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship.`,
} ,
harvest_invoice_fk:  {
  sql: `harvest_invoice_fk`,
  type: `string`,
  description: `A harvest invoice foreign key is a field in a database table that links or references a row or record in another table. It is made up of the primary key from one table and is used as the foreign key in another table. The purpose of a foreign key is to ensure data integrity and establish relationships between tables.`,
} ,
harvest_invoice_line_item_kind:  {
  sql: `harvest_invoice_line_item_kind`,
  type: `string`,
  description: `A harvest invoice line item kind is a type of item added to a goods and services invoice created in the Harvest invoicing software. Such item types can include project, description of the goods or services, type of the taxes, hours worked, quantity of items, unit rate, and the total amount to be charged.`,
} ,
harvest_invoice_line_item_description:  {
  sql: `harvest_invoice_line_item_description`,
  type: `string`,
  description: `A harvest invoice line item description is a brief explanation of each item included on an invoice. It typically includes pertinent information such as the item price, quantity, and total cost.`,
} ,
harvest_invoice_line_item_is_taxed:  {
  sql: `harvest_invoice_line_item_is_taxed`,
  type: `boolean`,
  description: `A harvest invoice line item that is taxed is an invoice line item that includes the applicable sales tax amount, as dictated by local and state laws.`,
} ,
}});
cube (`wh_delivery__harvest_time_sheets_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_time_sheets_fact`,
dimensions: {
harvest_timesheet_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_timesheet_pk`,
  description: `Harvest Timesheet PK is a web application designed to help small businesses and freelancers track their time and expenses. It allows users to easily log their time with a simple and intuitive web interface, and also compare their timesheets to track performance and profitability. Harvest Timesheet PK is designed to be easy to use and efficient with features such as timers, reports, financial forecasts, and more.`,
} ,
harvest_external_reference_jira_fk:  {
  sql: `harvest_external_reference_jira_fk`,
  type: `string`,
  description: `Harvest External Reference JIRA Foreign Key is an attribute associated with a JIRA entity that stores the user's Harvest ID for identity mapping and historical reporting. This foreign key is used to link the user's Harvest account with its corresponding JIRA account, allowing for traceability and accurate reporting.`,
} ,
harvest_task_fk:  {
  sql: `harvest_task_fk`,
  type: `string`,
  description: `A foreign key in a harvest task is a field or columns in a relational database table that links two tables together. It is used to connect one table to another and establish a relationship between them. For example, a foreign key in a harvest task table may link the harvest task table to a crop table, allowing the harvest task table to access information from the crop table.`,
} ,
harvest_project_fk:  {
  sql: `harvest_project_fk`,
  type: `string`,
  description: `A foreign key in a Harvest project is a column in the project's database table which holds the primary key value of another table. This allows related records to be linked together in a many-to-one relationship.`,
} ,
harvest_external_reference_jira_issue_key:  {
  sql: `harvest_external_reference_jira_issue_key`,
  type: `string`,
  description: `Harvest External Reference Jira Issue Key is a unique identifier which ties a Harvest Timer record to a corresponding Jira Issue. The External Reference is displayed near the top of the Timer details panel.`,
} ,
harvest_timesheet_notes:  {
  sql: `harvest_timesheet_notes`,
  type: `string`,
  description: `Harvest Timesheet Notes is a feature within the Harvest time tracking app that allows users to jot down notes while they are completing their timesheets. Users can add notes to keep track of how they spent their time and to document tasks that are relevant to the clients and projects they are working on. Not only does the feature provide a convenient way to keep track of the time a user has worked, it also creates a record for a project manager or client to look back on for information regarding the project.`,
} ,
harvest_timesheet_locked_reason:  {
  sql: `harvest_timesheet_locked_reason`,
  type: `string`,
  description: `Harvest Timesheet Locked Reason is typically when an administrator or manager has locked a timesheet in order to prevent any changes being made to the timesheet. This may be done to prevent an employee from adjusting their timesheet, or to ensure timesheet accuracy.`,
} ,
harvest_external_reference_permalink:  {
  sql: `harvest_external_reference_permalink`,
  type: `string`,
  description: `A Harvest external reference permalink is a permanent hyperlink to a resource outside of Harvest that can be used as a reference or bookmark. It is typically used to link to documents and webpages that are relevant to a project, task, or issue in Harvest.`,
} ,
harvest_external_reference_platform:  {
  sql: `harvest_external_reference_platform`,
  type: `string`,
  description: `The Harvest External Reference Platform (EPRP) is an online platform from Harvest, a provider of IT services and consulting, that helps organizations increase the productivity of enterprise applications and database management systems by providing data synchronization and management tools. These tools help organizations keep their systems up-to-date, allowing them to access large amounts of data quickly and efficiently. By connecting desktop systems to web services—including enterprise applications, web-based content providers, and database servers—the platform helps organizations efficiently manage large amounts of data and maintain system integrity. Additionally, the Harvest EPRP provides tools for efficient auditing and reporting, making it easy to track data changes and detect errors or malicious activities.`,
} ,
harvest_timesheet_is_billable:  {
  sql: `harvest_timesheet_is_billable`,
  type: `boolean`,
  description: `Harvest Timesheet is not a billable item. It is a software used to track and manage your time and project data; it does not generate invoices or charge for its services.`,
} ,
harvest_timesheet_is_closed:  {
  sql: `harvest_timesheet_is_closed`,
  type: `boolean`,
  description: `Harvest Timesheet is closed indicates that timesheet tracking has been turned off in a Harvest account. This means that employees no longer need to record the time they spend on tasks or projects in the system. In other words, their time will not be tracked or tracked against a project for billing or for reporting.`,
} ,
harvest_timesheet_is_running:  {
  sql: `harvest_timesheet_is_running`,
  type: `boolean`,
  description: `Harvest Timesheet is an internet-based time tracking and project management service. It is designed to help small businesses, teams and freelancers to track who is working on what, when and how much they are spending. With Harvest, you can easily track the hours your team spends on each project and then bill your clients accordingly. It also gives you the ability to track billable and non-billable time, and you can even set budgets for each project and receive alerts when those budgets are exceeded.`,
} ,
harvest_timesheet_is_billed:  {
  sql: `harvest_timesheet_is_billed`,
  type: `boolean`,
  description: `Harvest Timesheet is billed based on the number of users on the account. The pricing per user varies depending on the type of plan you select. The monthly or annual plans offer discounts for the longer commitment.`,
} ,
harvest_timesheet_is_locked:  {
  sql: `harvest_timesheet_is_locked`,
  type: `boolean`,
  description: `Harvest timesheet is locked is a feature that prevents timesheets from being altered once an employee has submitted them to their supervisor. This helps maintain the integrity of time tracking data and ensures accurate time tracking and reporting.`,
} ,
harvest_timesheet_created_at_ts:  {
  sql: `harvest_timesheet_created_at_ts`,
  type: `time`,
  description: `Harvest Timesheet is a web-based timesheet and invoicing system designed to help businesses and freelancers track their time, send invoices, and measure productivity. It was created by Harvest, a product of Freshbooks, in 2008.`,
} ,
harvest_timesheet_timer_started_at_ts:  {
  sql: `harvest_timesheet_timer_started_at_ts`,
  type: `time`,
  description: `Harvest Timesheet Timer started at TS is an online time and project tracking application that allows users to track the time they spend working on projects, tasks and services. With Harvest, users can easily monitor the hours they spend on each project, quickly track and submit timesheets, and get detailed reports on all their time and project activities.`,
} ,
harvest_timesheet_started_at:  {
  sql: `harvest_timesheet_started_at`,
  type: `string`,
  description: `Harvest Timesheets first launched in 2012.`,
} ,
harvest_timesheet_updated_at_ts:  {
  sql: `harvest_timesheet_updated_at_ts`,
  type: `time`,
  description: `Harvest Timesheet is time tracking software designed to help track hours worked on projects and clients for businesses. It allows users to log their time, keep track of projects, assign tasks and collaborate with their team. The TS feature updates Harvest with timesheets that have been submitted, approved, distributed, exported and merged. It includes a visual activity chart which shows users their progress over the week.`,
} ,
harvest_timesheet_spent_at_ts:  {
  sql: `harvest_timesheet_spent_at_ts`,
  type: `time`,
  description: `Harvest Timesheet is a web-based time tracking system which allows users to easily track, log, and submit time worked. Features include a timer, an intuitive web-based timesheet, project management, reporting, and invoicing. It is designed to enable businesses of any size to track employee time and manage projects effectively.`,
} ,
}});
cube (`wh_delivery__jira_daily_issue_field_history_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_daily_issue_field_history_fact`,
dimensions: {
jira_daily_issue_field_history_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_daily_issue_field_history_pk`,
  description: `Jira Daily Issue Field History PK is a special field in Jira that keeps track of the changes that were made to an issue over time. It stores a new record whenever an issue is updated, and the data fields include: issue number, data and time of the change, name of user who made the change, and issue field that was changed. The records are stored in a unique format, or \"PK,\" which is a protected key that keeps the records safe from unnecessary changes.`,
} ,
jira_issue_fk:  {
  sql: `jira_issue_fk`,
  type: `string`,
  description: `Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication.`,
} ,
jira_daily_issue_field_history_status:  {
  sql: `jira_daily_issue_field_history_status`,
  type: `string`,
  description: `Jira's Daily Issue Field History Status is a feature on the Jira platform that allows users to view the history of the changes that have been made to an issue's custom fields. This information is displayed in a timeline and includes the user who made the change, the date and time of the change, and the changes that were made. Additionally, a comment may also be attached to each change to explain the rationale behind it. This feature provides valuable insight into the progress of an issue over time and can be a useful tool for project managers, developers, and other stakeholders.`,
} ,
jira_daily_issue_field_history_sprint:  {
  sql: `jira_daily_issue_field_history_sprint`,
  type: `string`,
  description: `JIRA Daily Issue Field History Sprint is an Atlassian-powered feature that tracks the history of field changes for one or more selected issues over a period of time. It helps you to analyse the impact of different field changes on issues, estimate or review the progress of your team and identify major bottlenecks. It can also be used to get a better understanding of how work is progressing in a sprint or project.`,
} ,
jira_daily_issue_field_history_date_day:  {
  sql: `jira_daily_issue_field_history_date_day`,
  type: `time`,
  description: `The JIRA Daily Issue Field History Date Day is a field on the JIRA tracker that stores the date when an activity occurred on an issue. It is typically automatically set to the date of the activity, and can be searchable. This field can be used to track the history of an issue, including when tasks and conversations happened.`,
} ,
}});
cube (`wh_delivery__jira_epics_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_epics_dim`,
dimensions: {
jira_epic_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_epic_pk`,
  description: `An Epic is a large user story or collection of smaller user stories that is larger than a typical user story but smaller than a project. It is a way to group user stories into a single unit. The epic has a primary key that is assigned to it, which is used to identify and track the epic throughout its lifecycle.`,
} ,
jira_epic_name:  {
  sql: `jira_epic_name`,
  type: `string`,
  description: `In Jira, an Epic is a large body of work that is broken down into a number of smaller stories, or sometimes called \"Issues\" in Jira. It is often a narrative or large user story that captures the intent of the work to be carried out. Epic names, however, rely mainly on the discretion of the user.`,
} ,
jira_epic_summary:  {
  sql: `jira_epic_summary`,
  type: `string`,
  description: `A Jira Epic Summary is a summary associated with each Epic in the project. It allows users to quickly review the scope and purpose of the Epic and its linked issues. The Epic Summary is found on the Epic's details page, and includes the Epic Name, Summary, Status, Priority, and team associated with the Epic.`,
} ,
jira_epic_is_done:  {
  sql: `jira_epic_is_done`,
  type: `boolean`,
  description: `A Jira epic is done when all of the tasks and stories within the epic have been completed and all of the acceptance criteria have been met. The project team can then review the completed epic and sign off on it.`,
} ,
jira_epic_key:  {
  sql: `jira_epic_key`,
  type: `string`,
  description: `An Epic key is a unique identifier used in Jira to represent an Epic. It has a format of ‘EPIC-key#’, where key# is usually given by the user or else automatically generated.`,
} ,
}});
cube (`wh_delivery__jira_issues_field_history_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_field_history_fact`,
dimensions: {
jira_issues_field_history_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_issues_field_history_pk`,
  description: `The issues field history primary key is a unique identifier that is assigned to each record in the field history table. It is used to uniquely identify each record and also serves as a reference point when linking related records.`,
} ,
jira_field_fk:  {
  sql: `jira_field_fk`,
  type: `string`,
  description: `A Jira Field Foreign Key is a type of field in Jira that can be used to link different issues. It provides a way to keep track of related tasks, previously opened bugs and even future tasks by connecting them all with a foreign key. It also helps to quickly find related issues and bring updates from related issues in the main view.`,
} ,
jira_issue_fk:  {
  sql: `jira_issue_fk`,
  type: `string`,
  description: `Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication.`,
} ,
jira_issue_field_history_is_active:  {
  sql: `jira_issue_field_history_is_active`,
  type: `boolean`,
  description: `Yes, the Jira Issue Field History is active. The Issue Field History provides information about changes made to the specific field in an issue. It shows when, who and what value the field had at that point in time.`,
} ,
jira_issue_field_history_status_description:  {
  sql: `jira_issue_field_history_status_description`,
  type: `string`,
  description: `Jira Issue Field History is a tool within Jira that allows administrators the ability to audit changes to certain fields on an issue. It captures when a field is changed, who made the change, from which value to which value, and optional associated comments.`,
} ,
jira_issue_field_history_status_name:  {
  sql: `jira_issue_field_history_status_name`,
  type: `string`,
  description: `The Jira issue field history status name is \"Status\". This is the field that holds the current and historic values of the Status of the Jira issue, such as Open, In Progress, Reopened, Closed, etc.`,
} ,
jira_issue_field_history_timestamp:  {
  sql: `jira_issue_field_history_timestamp`,
  type: `time`,
  description: `A Jira Issue Field History Timestamp is a timestamp that records the last time the value of a field was changed in a JIRA issue. It is used to track the latest changes made to any field value within the JIRA issue.`,
} ,
}});
cube (`wh_delivery__jira_issues_xa`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_xa`,
dimensions: {
jira_issue_summary_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_issue_summary_pk`,
  description: `Jira Issue Summary Primary Key is a unique identifier that identifies each issue within a project in Jira. It is composed of a project abbreviation, issue type abbreviation, and an issue number, all separated by a hyphen (for example, EX-123). The Key helps to easily identify issues while tracking a project.`,
} ,
jira_issue_development_stage:  {
  sql: `jira_issue_development_stage`,
  type: `string`,
  description: `Jira issue development stage is an internal workflow that tracks the progress of any development project within an organization. It lays out the process of tasks, deliverables, review periods and milestones required to complete a project. The typical stages in a Jira issue development process include planning, development, testing, release, and closure. Additionally, an organization might add other custom stages to their process to better track progress and keep stakeholders informed.`,
} ,
}});
