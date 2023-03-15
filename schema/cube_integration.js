cube (`wh_core__clients_bridge`, {
sql: `select * from lewis_analytics_dev.wh_core__clients_bridge`,
joins : {
wh_delivery__harvest_clients_dim:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_client_fk} = ${wh_delivery__harvest_clients_dim.harvest_client_pk}`,
} ,
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_project_fk} = ${wh_delivery__jira_projects_fact.jira_project_pk}`,
} ,
},
dimensions: {
client_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `client_pk`,
  description: ``,
} ,
harvest_client_fk:  {
  sql: `harvest_client_fk`,
  type: `string`,
  description: ``,
} ,
jira_project_fk:  {
  sql: `jira_project_fk`,
  type: `string`,
  description: ``,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_core__people_bridge`, {
sql: `select * from lewis_analytics_dev.wh_core__people_bridge`,
joins : {
wh_delivery__jira_users_dim:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_fk} = ${wh_delivery__jira_users_dim.jira_user_pk}`,
} ,
wh_delivery__harvest_employees_dim:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_employee_fk} = ${wh_delivery__harvest_employees_dim.harvest_employee_pk}`,
} ,
},
dimensions: {
person_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `person_pk`,
  description: ``,
} ,
jira_user_fk:  {
  sql: `jira_user_fk`,
  type: `string`,
  description: ``,
} ,
harvest_employee_fk:  {
  sql: `harvest_employee_fk`,
  type: `string`,
  description: ``,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_core__sprints_bridge`, {
sql: `select * from lewis_analytics_dev.wh_core__sprints_bridge`,
joins : {
wh_delivery__jira_sprints_dim:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_sprint_fk} = ${wh_delivery__jira_sprints_dim.jira_sprint_pk}`,
} ,
wh_delivery__harvest_projects_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_project_fk} = ${wh_delivery__harvest_projects_fact.harvest_project_pk}`,
} ,
},
dimensions: {
sprint_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `sprint_pk`,
  description: ``,
} ,
jira_sprint_fk:  {
  sql: `jira_sprint_fk`,
  type: `string`,
  description: ``,
} ,
harvest_project_fk:  {
  sql: `harvest_project_fk`,
  type: `string`,
  description: ``,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_clients_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_clients_dim`,
joins : {
wh_core__clients_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_client_pk} = ${wh_core__clients_bridge.harvest_client_fk}`,
} ,
wh_delivery__harvest_invoices_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_client_pk} = ${wh_delivery__harvest_invoices_fact.harvest_client_fk}`,
} ,
wh_delivery__harvest_projects_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_client_pk} = ${wh_delivery__harvest_projects_fact.harvest_client_fk}`,
} ,
wh_delivery__harvest_expenses_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_client_pk} = ${wh_delivery__harvest_expenses_fact.harvest_client_fk}`,
} ,
},
dimensions: {
harvest_client_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_client_pk`,
  description: `Harvest Client PK is an ID belonging to each client in Harvest. It is a unique ID used to identify each individual client, and can be found in the URL when viewing the client profile.`,
} ,
harvest_client_name:  {
  sql: `harvest_client_name`,
  type: `string`,
  description: `The Harvest Client is an online time tracking, invoicing, and expense reporting software and mobile application.`,
} ,
harvest_client_currency:  {
  sql: `harvest_client_currency`,
  type: `string`,
  description: `Harvest Client Currency is the currency that clients will be invoiced in when using the Harvest software. This currency can be set in the Client Settings menu in the Harvest dashboard.`,
} ,
harvest_client_is_active:  {
  sql: `harvest_client_is_active`,
  type: `boolean`,
  description: `Harvest Client is active is an online time tracking and invoicing tool used by many businesses and organizations. It is used to accurately track time and expenses related to any project, invoice customers, and generate detailed reports. It also integrates with popular services like Asana, Basecamp, and Slack. Harvest Client helps streamline processes, provide insights into project performance, and help make sure you get paid on time.`,
} ,
harvest_client_created_at_ts:  {
  sql: `harvest_client_created_at_ts`,
  type: `time`,
  description: `Harvest Client Created At TS is a tool designed to help companies manage their time tracking data. It allows users to track employee time and work hours, see the amount of time each active employee has logged, and generate reports with the data.`,
} ,
harvest_client_updated_at_ts:  {
  sql: `harvest_client_updated_at_ts`,
  type: `time`,
  description: `Harvest Client is a time tracking and project management application that helps users track time and generate invoices, while keeping everyone on the same page. It was last updated on August 12, 2020.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_employees_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_employees_dim`,
joins : {
wh_delivery__harvest_invoices_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_employee_pk} = ${wh_delivery__harvest_invoices_fact.harvest_employee_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_employee_pk} = ${wh_core__people_bridge.harvest_employee_fk}`,
} ,
wh_delivery__harvest_expenses_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_employee_pk} = ${wh_delivery__harvest_expenses_fact.harvest_employee_fk}`,
} ,
},
dimensions: {
harvest_employee_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_employee_pk`,
  description: `A harvest employee primary key is a unique identifier assigned to each individual employee in a harvest system. It is typically a combination of the employee's name and a number, such as 'John_Smith_001', and is used to identify and reference the employee in the system.`,
} ,
harvest_employee_first_name:  {
  sql: `harvest_employee_first_name`,
  type: `string`,
  description: `Harvest employee first names vary depending on the employee.`,
} ,
harvest_employee_last_name:  {
  sql: `harvest_employee_last_name`,
  type: `string`,
  description: `Harvest does not employ individuals and does not use last names.`,
} ,
harvest_employee_full_name:  {
  sql: `harvest_employee_full_name`,
  type: `string`,
  description: `Harvest's full name is Harvest Profit, Inc.`,
} ,
harvest_employee_email:  {
  sql: `harvest_employee_email`,
  type: `string`,
  description: `Harvest employee email addresses typically use the company domain name. For example, if the company domain name is <companyname>.com, then each employee's email address would be their first initial, last name@<companyname>.com.`,
} ,
harvest_employee_is_contractor:  {
  sql: `harvest_employee_is_contractor`,
  type: `boolean`,
  description: `A harvest employee is a contract worker, who is often self-employed, and is hired by a company or individual to complete a specific project. Generally, a harvest employee is paid an hourly rate or set fee for the project, instead of a full-time salary. They are typically used when an employer needs to fill a temporary or short-term need and are otherwise known as freelancers or contract employees.`,
} ,
harvest_employee_is_active:  {
  sql: `harvest_employee_is_active`,
  type: `boolean`,
  description: `A harvest employee is considered active if they have logged in or taken any action on the Harvest platform within the last 6 months.`,
} ,
harvest_employee_created_at_ts:  {
  sql: `harvest_employee_created_at_ts`,
  type: `time`,
  description: `Harvest is a time tracking and invoicing software owned by Harvest Inc. It was founded in 2006 by two engineers, Jesse Tane and Shawn Simon, and is headquartered in New York City. The software is used by small businesses, freelancers, and larger corporations to help tracking employee time, projects, and clients.`,
} ,
harvest_employee_updated_at_ts:  {
  sql: `harvest_employee_updated_at_ts`,
  type: `time`,
  description: `Harvest Employee Updated At TS (or Harvest Employee Update TimeStamp) is a time-stamp used by the software tool Harvest to indicate when an employee was last updated in the system. The time indicated in the timestamp represents the timestamp of the last action taken by an employee on their account, such as updating their personal information, logging hours, completing assignments or submitting timesheets.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_invoices_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoices_fact`,
joins : {
wh_delivery__harvest_invoice_line_items_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_invoice_pk} = ${wh_delivery__harvest_invoice_line_items_fact.harvest_invoice_fk}`,
} ,
wh_delivery__harvest_expenses_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_invoice_pk} = ${wh_delivery__harvest_expenses_fact.harvest_invoice_fk}`,
} ,
},
dimensions: {
harvest_invoice_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_invoice_pk`,
  description: `Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to.`,
} ,
harvest_client_fk:  {
  sql: `harvest_client_fk`,
  type: `string`,
  description: `A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data.`,
} ,
harvest_employee_fk:  {
  sql: `harvest_employee_fk`,
  type: `string`,
  description: `A harvest employee foreign key is a field in a database table that is used to uniquely identify a particular record or row in another table. This is known as a foreign key because it relates to the primary key of another table, usually located in a different database.`,
} ,
harvest_invoice_client_key:  {
  sql: `harvest_invoice_client_key`,
  type: `string`,
  description: `A Harvest Invoice Client Key is a unique identifier that Harvest assigns to each customer when they create a profile. It is used by the Harvest Invoice service to identify customers when sending invoices and processing payments.`,
} ,
harvest_invoice_number:  {
  sql: `harvest_invoice_number`,
  type: `string`,
  description: `Harvest invoice numbers are unique numerical identifiers assigned to invoices created in the Harvest software. They are used to track, manage, and organize payments from customers and clients.`,
} ,
harvest_invoice_purchase_order:  {
  sql: `harvest_invoice_purchase_order`,
  type: `string`,
  description: `A harvest invoice purchase order is an order created by the purchaser, used to request goods or services from the vendor. It typically includes details on the goods or services requested, the quantity requested, and the agreed-upon pricing. This document serves as an agreement between the buyer and seller and serves as a legal document if any dispute should arise.`,
} ,
harvest_invoice_state:  {
  sql: `harvest_invoice_state`,
  type: `string`,
  description: `Harvest Invoice state is a set of information stored by the system when an invoice is created in Harvest. Depending on the invoice status, that information may include its payment status, payment amount, date the invoice was created or sent, date the invoice was paid, email address used to send the invoice, and more.`,
} ,
harvest_invoice_notes:  {
  sql: `harvest_invoice_notes`,
  type: `string`,
  description: `Harvest invoice notes are optional fields added to invoices that are used to provide any additional information pertinent to the invoice—such as terms of payment or a special message for the customer. The notes are visible when viewing the invoice, and included in all invoices sent by Harvest.`,
} ,
harvest_invoice_subject:  {
  sql: `harvest_invoice_subject`,
  type: `string`,
  description: `Harvest Invoice subject lines typically include the words “Invoice” and a brief description of the services or goods sold. For example, “Invoice for Web Design Services” or “Invoice for Ad Design.”`,
} ,
harvest_invoice_currency:  {
  sql: `harvest_invoice_currency`,
  type: `string`,
  description: `Harvest Invoice currency is determined by the currency set on your invoice settings page. This page can be accessed from the Settings tab of your project. You can choose from US Dollars, Canadian Dollars, British Pounds, and Euro.`,
} ,
harvest_invoice_payment_term:  {
  sql: `harvest_invoice_payment_term`,
  type: `string`,
  description: `The payment term for a harvest invoice is typically 14 days net. This means that the full amount of the invoice is due to the seller 14 days after the invoice was issued.`,
} ,
harvest_invoice_period_start:  {
  sql: `harvest_invoice_period_start`,
  type: `time`,
  description: `A harvest invoice period start is the date that a billing period starts, usually when a new contract is in effect or an invoice is generated. It is usually used to define when an amount of payment is due.`,
} ,
harvest_invoice_period_end:  {
  sql: `harvest_invoice_period_end`,
  type: `time`,
  description: `Harvest Invoice Period End is a feature within Harvest that allows you to set an end date for any invoices that you choose to generate. This end date is set so that all invoices that were created will be marked as “complete” by the specified period end.`,
} ,
harvest_invoice_paid_date:  {
  sql: `harvest_invoice_paid_date`,
  type: `time`,
  description: `Harvest invoice paid date is the date on which the invoice is paid by the customer. It is up to the customer to decide when to make the payment, and this date may vary depending on their payment terms.`,
} ,
harvest_invoice_issue_date:  {
  sql: `harvest_invoice_issue_date`,
  type: `time`,
  description: `The issue date of a harvest invoice will depend on the individual vendor and their chosen accounting system. Generally, the issue date is the same as the date of the service or sale.`,
} ,
harvest_invoice_due_date:  {
  sql: `harvest_invoice_due_date`,
  type: `time`,
  description: `Harvest invoice due dates vary according to the payment terms set up with each customer. Most pay invoices within 15 to 30 days of the invoice date.`,
} ,
harvest_invoice_created_at:  {
  sql: `harvest_invoice_created_at`,
  type: `time`,
  description: `A Harvest invoice is usually created when a payment is made for a service or product. The date of creation is typically the date of purchase.`,
} ,
harvest_invoice_sent_at:  {
  sql: `harvest_invoice_sent_at`,
  type: `time`,
  description: `Harvest invoice sent at is the time that an invoice is generated and sent to a customer or client. This is typically done through email or another online billing system. The invoice can include details of the goods and services bought and any applicable payment terms, taxes, and fees.`,
} ,
harvest_invoice_paid_at:  {
  sql: `harvest_invoice_paid_at`,
  type: `time`,
  description: `A harvest invoice is typically paid at the time of delivery, or within the stipulated payment terms stated in the invoice.`,
} ,
harvest_invoice_updated_at:  {
  sql: `harvest_invoice_updated_at`,
  type: `time`,
  description: `The exact date an invoice is updated at will depend on several factors, such as the type of invoice being updated, the type of product being purchased, and the location of the seller. Many invoices on Harvest also have the date of the last update listed near the top of the page.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_invoices_xa`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_invoices_xa`,
joins : {
wh_delivery__harvest_invoice_line_items_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_invoice_pk} = ${wh_delivery__harvest_invoice_line_items_fact.harvest_invoice_fk}`,
} ,
wh_delivery__harvest_expenses_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_invoice_pk} = ${wh_delivery__harvest_expenses_fact.harvest_invoice_fk}`,
} ,
},
dimensions: {
harvest_invoice_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_invoice_pk`,
  description: `Harvest Invoice PK (Public Key) is a unique identifier that accompanies each invoice generated within the Harvest platform. This public key allows users to keep track of invoices and securely access the details of them whenever they need to.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_projects_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_projects_fact`,
joins : {
wh_delivery__harvest_invoice_line_items_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_project_pk} = ${wh_delivery__harvest_invoice_line_items_fact.harvest_project_fk}`,
} ,
wh_delivery__harvest_expenses_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.harvest_project_pk} = ${wh_delivery__harvest_expenses_fact.harvest_project_fk}`,
} ,
wh_delivery__harvest_time_sheets_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_project_pk} = ${wh_delivery__harvest_time_sheets_fact.harvest_project_fk}`,
} ,
wh_core__sprints_bridge:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_project_pk} = ${wh_core__sprints_bridge.harvest_project_fk}`,
} ,
},
dimensions: {
harvest_project_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_project_pk`,
  description: `Harvest Project PK is an NGO based in Pakistan that works to build a better future for vulnerable communities. The organization focuses on empowerment, especially for women, through education, health, and sustainable development. Their initiatives have had an impact on nearly 1 million people in 300+ villages. Their main mission is to unlock Pakistan’s potential to end poverty by 2030 and to ensure that all people, regardless of gender, socio-economic status, access to resources, and skill level, can thrive, participate, and contribute to the development of their communities.`,
} ,
harvest_client_fk:  {
  sql: `harvest_client_fk`,
  type: `string`,
  description: `A harvest client foreign key is a unique identifier associated with a client in a database in order to easily establish relationships with other data tables. It allows a database system to quickly and accurately associate a client with their data.`,
} ,
harvest_project_name:  {
  sql: `harvest_project_name`,
  type: `string`,
  description: `Harvest project names can vary depending on the type of project, but some examples include Harvest Solutions, Croptime, HarvestFarms, AgroHarvest, and FieldLogic.`,
} ,
harvest_project_code:  {
  sql: `harvest_project_code`,
  type: `string`,
  description: `Harvest Project Code is a website that provides open-source software development tools specifically designed to increase the efficiency, speed, and accuracy of projects. The code is designed to help software developers work together more effectively and quickly in a collaborative, distributed manner. The tools are primarily focused on task management, bug tracking, and source control, although other features also exist.`,
} ,
harvest_project_notes:  {
  sql: `harvest_project_notes`,
  type: `string`,
  description: `Harvest Project Notes is a mobile web platform that serves as a knowledge tool and central hub for education, evaluation and program planning for community organizations and non-profit agencies. It provides a secure environment for collaboration and central access to a shared set of resources and tools for agency staff to better manage their data. It offers an array of applications including assessment and tracking, monetary and technical resources, workflow automation, reporting and analytics, and more.`,
} ,
harvest_project_bill_by:  {
  sql: `harvest_project_bill_by`,
  type: `string`,
  description: `The Harvest Project bill is supported and funded by the United States Department of Agriculture's Farm Service Agency and the Natural Resources Conservation Service.`,
} ,
harvest_project_budget_by:  {
  sql: `harvest_project_budget_by`,
  type: `string`,
  description: `The budget for a harvest project will vary depending on factors such as the size and scope of the project, any equipment that needs to be purchased or rented, and the amount of labor required. Generally speaking, a harvest project budget should include a balance of funds for labor, materials, overhead costs, and contingency funds.`,
} ,
harvest_project_show_budget_to_all:  {
  sql: `harvest_project_show_budget_to_all`,
  type: `boolean`,
  description: `The Harvest Project show budget will depend on the type of show, location, production elements, and other factors. The best way to get an estimate is to contact the Harvest Project and discuss your needs with their staff.`,
} ,
harvest_project_cost_budget_include_expenses:  {
  sql: `harvest_project_cost_budget_include_expenses`,
  type: `boolean`,
  description: `The cost of a harvest project will vary greatly depending on the type of harvest, the size and scope of the project, and other factors. A basic harvesting project cost budget will typically include materials and supplies, equipment rental or purchasing, labor costs, transport and accommodation, consultant fees, and other related expenses. Other costs may include permits, marketing, and any contingencies.`,
} ,
harvest_project_budget_is_monthly:  {
  sql: `harvest_project_budget_is_monthly`,
  type: `boolean`,
  description: `The budget for Harvest projects can vary greatly depending on what is involved. Some projects may require minimal costs, such as purchasing seed and equipment, while others could require more significant investments, such as hiring people to help with the project and buying land. It is best to determine your budget before getting started so that you can plan accordingly.`,
} ,
harvest_project_notify_when_over_budget:  {
  sql: `harvest_project_notify_when_over_budget`,
  type: `boolean`,
  description: `Harvest Project Notify is a feature of the Harvest Project Management tool that sends notifications when projects exceed their budgets. It helps project managers to monitor the progress of their projects and be informed if they are going over budget. The notifications will include information about the current project cost versus its budgeted cost, and will alert managers to potential financial issues with their projects.`,
} ,
harvest_project_is_billable:  {
  sql: `harvest_project_is_billable`,
  type: `boolean`,
  description: `No, the Harvest Project is not billable. The Harvest Project is a research effort initiated by the National Center for Aerospace and Transportation Technologies (NCATT) to identify and collect data on the economic and environmental benefits of sustainable aviation biofuel production and use. It is funded by the Federal Aviation Administration (FAA) and a coalition of industry partners. The project includes research activities such as socio-economic impact analysis and policy development, as well as educational outreach.`,
} ,
harvest_project_is_fixed_fee:  {
  sql: `harvest_project_is_fixed_fee`,
  type: `boolean`,
  description: `Harvest project fixed-fee is a per-project basis that is structured upfront. This fee is used to provide customers with an agreed-upon project timeline, budget, deliverables, and resources. This allows clients to know before a project starts that they are paying a fixed fee and that there will be no surprises or hidden costs. The fixed-fee option also allows customers to rest assured that their project is completed on time and on budget.`,
} ,
harvest_project_is_active:  {
  sql: `harvest_project_is_active`,
  type: `boolean`,
  description: `Yes, the Harvest Project is currently active and operating in several locations in the United States. The Harvest Project works to provide immediate, tangible resources to families facing crisis, and works to build trust, referrals and connections to lead to pathways to end poverty and to increase self-sufficiency.`,
} ,
harvest_project_over_budget_notification_date:  {
  sql: `harvest_project_over_budget_notification_date`,
  type: `time`,
  description: `The exact date for a harvest project over budget notification depends on the particular project and its budget guidelines. In most cases, over budget notifications are issued as soon as it is identified that the project is unable to meet its budget.`,
} ,
harvest_project_created_at:  {
  sql: `harvest_project_created_at`,
  type: `time`,
  description: `Harvest Project was created at the University of Calgary in Canada.`,
} ,
harvest_project_ends_on:  {
  sql: `harvest_project_ends_on`,
  type: `time`,
  description: `The Harvest Project typically ends on the last day of October, or Halloween.`,
} ,
harvest_project_updated_at:  {
  sql: `harvest_project_updated_at`,
  type: `time`,
  description: `The latest version of Harvest Project was updated on June 10, 2020.`,
} ,
harvest_project_starts_on:  {
  sql: `harvest_project_starts_on`,
  type: `time`,
  description: `The Harvest Project typically starts in late summer and continues until the end of fall or early winter. However, the exact starting date for the project is determined by the region's growing season and can vary from year to year.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__harvest_tasks_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__harvest_tasks_dim`,
joins : {
wh_delivery__harvest_time_sheets_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.harvest_task_pk} = ${wh_delivery__harvest_time_sheets_fact.harvest_task_fk}`,
} ,
},
dimensions: {
harvest_task_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `harvest_task_pk`,
  description: `A primary key is a unique identifier that is used to uniquely identify a single row or record in a database table. A harvest task primary key is a field, or multiple fields, that uniquely identifies a particular record in the harvest task table. It is typically used as a reference to identify a specific record and allows for data retrievals and updates to be made in an organized and efficient manner.`,
} ,
harvest_task_name:  {
  sql: `harvest_task_name`,
  type: `string`,
  description: `Harvest Task is the platform used for time tracking and invoicing for freelancers and contractors.`,
} ,
harvest_task_is_billable_by_default:  {
  sql: `harvest_task_is_billable_by_default`,
  type: `boolean`,
  description: `No, by default, harvest tasks are not billable. Billability can be set on a task-by-task basis.`,
} ,
harvest_task_is_default:  {
  sql: `harvest_task_is_default`,
  type: `boolean`,
  description: `Harvest task is default is a task scheduler used by Harvest which allows you to schedule tasks that are repeated regularly on a daily, weekly, or monthly basis. Tasks can be setup to be executed at a certain time each day or week, or to only run once, such as a weekly balance sheet update. Harvest task is default allows you to automate many of the repetition tasks you would have to manually complete, such as updating data or reports.`,
} ,
harvest_task_is_active:  {
  sql: `harvest_task_is_active`,
  type: `boolean`,
  description: `Harvest task is active is when an individual is in charge of maintaining and harvesting a particular crop. This includes activities such as planting, fertilizing, pruning, irrigating, weeding and harvesting. Harvest task is an essential part of any agricultural management plan and is necessary for guaranteeing good yields.`,
} ,
harvest_task_created_at_ts:  {
  sql: `harvest_task_created_at_ts`,
  type: `time`,
  description: `A Harvest Task is a time tracking and project management tool that enables employers to keep track of their team’s progress on specific tasks. It allows managers to assign, track and review tasks in an organized way. Tasks and projects can also be tracked in real-time with the help of Harvest.`,
} ,
harvest_task_updated_at_ts:  {
  sql: `harvest_task_updated_at_ts`,
  type: `time`,
  description: `Harvest Task Updated at TS typically refers to tasks that have been updated in Harvest, a project management and time-tracking software. It means that a previously created task has been modified in some way, either by adding more information or making changes to the due date.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_fields_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_fields_dim`,
joins : {
wh_delivery__jira_issues_field_history_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_field_pk} = ${wh_delivery__jira_issues_field_history_fact.jira_field_fk}`,
} ,
},
dimensions: {
jira_field_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_field_pk`,
  description: `Jira Field PK (primary key) is an automatically generated, unique identifier used when creating a Jira issue. It is used to uniquely identify each Jira issue and is typically made up of a combination of numbers and letters.`,
} ,
jira_field_name:  {
  sql: `jira_field_name`,
  type: `string`,
  description: `The Jira field name is a way of labeling the various custom fields that can be created and utilized in Jira, such as Priority, Assignee, Reporter, and more.`,
} ,
jira_field_is_array:  {
  sql: `jira_field_is_array`,
  type: `boolean`,
  description: `A Jira field is an array of information stored on an issue within a Jira project. It can contain information about a certain part of the project such as project details, systems, tasks, subtasks, custom fields, and more. Each array contains key-value pairs that are stored on an issue depending on the type of data it stores.`,
} ,
jira_field_is_custom:  {
  sql: `jira_field_is_custom`,
  type: `boolean`,
  description: `Jira Field is Custom refers to the ability to make custom fields in Jira software. This feature gives admins control over the types of data they track in their project, allowing them to create additional fields of information that meet their project needs. Custom fields can be used to store a wide range of data and help make your Jira workflow even more efficient.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_issues_board_bridge`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_board_bridge`,
joins : {
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_fk} = ${wh_delivery__jira_issues_fact.jira_issue_pk}`,
} ,
},
dimensions: {
jira_issue_board_bridge_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_issue_board_bridge_pk`,
  description: `Jira Issue Board Bridge PK is a generic tool that provides integration between Jira Issue Board and any third-party system, allowing teams to share data and create a seamless collaboration workflow. It allows users to update Jira tickets from issue boards, and update issue boards from Jira tickets. It also enables sharing of custom fields between the two systems. Jira Issue Board Bridge can be used for synchronizing changes between Jira plans and external systems, such as project management tools, customer service applications, and many others.`,
} ,
jira_issue_fk:  {
  sql: `jira_issue_fk`,
  type: `string`,
  description: `Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication.`,
} ,
jira_board_fk:  {
  sql: `jira_board_fk`,
  type: `string`,
  description: `A JIRA board foreign key is a column in a database table that establishes a relationship between two tables. It is used to ensure that the values in the foreign key field are only those allowed in the primary table. It also ensures that any changes made to the primary table are reflected in the related foreign table.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_issues_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_fact`,
joins : {
wh_delivery__jira_daily_issue_field_history_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_pk} = ${wh_delivery__jira_daily_issue_field_history_fact.jira_issue_fk}`,
} ,
wh_delivery__jira_issues_sprint_bridge:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_pk} = ${wh_delivery__jira_issues_sprint_bridge.jira_issue_fk}`,
} ,
wh_delivery__jira_issues_board_bridge:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_pk} = ${wh_delivery__jira_issues_board_bridge.jira_issue_fk}`,
} ,
wh_delivery__jira_issues_field_history_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_pk} = ${wh_delivery__jira_issues_field_history_fact.jira_issue_fk}`,
} ,
},
dimensions: {
jira_issue_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_issue_pk`,
  description: `In Jira, the primary key of an issue is the Issue Number, which is a unique, numbered identifier for each issue in the system. It is used to differentiate between different issues and can be used to reference an issue when discussing it or searching for it in the system.`,
} ,
jira_issue_parent_fk:  {
  sql: `jira_issue_parent_fk`,
  type: `string`,
  description: `Jira Issue ParentForeignKey (also known as Story Parent Issue Key) is a field that is populated when setting up complex parent-child relationships between issues in Jira. This field tracks the issue key (a unique identifier for each issue) of the parent issue for any child issue. It is used to keep track of the relation between multiple issues that may be used as part of a larger workflow, and to help ensure that issues are properly organized in the system.`,
} ,
jira_user_fk:  {
  sql: `jira_user_fk`,
  type: `string`,
  description: `A Jira user foreign key is a unique identifier that contains information related to a specific user who is accessing a Jira instance. It is used to link a user's data across different Jira instances or datastores. The value of the foreign key is typically an alphanumeric string and can be used to access user-specific data relative to their permissions.`,
} ,
jira_creator_fk:  {
  sql: `jira_creator_fk`,
  type: `string`,
  description: `A foreign key is a field in a database table that is used to link two different tables. In JIRA, a foreign key is used to identify the creator of an issue, such as an Epic or a Story. It is typically used to link the creator of one issue to other related issues.`,
} ,
jira_reporter_fk:  {
  sql: `jira_reporter_fk`,
  type: `string`,
  description: `A Jira reporter foreign key is a reference key linking external user records with user records within Jira. This allows a foreign system to connect user records with Jira to ensure that any data submitted to Jira is tied to the correct user account.`,
} ,
jira_resolution_fk:  {
  sql: `jira_resolution_fk`,
  type: `string`,
  description: `Jira Resolutionforeign Key is an option within the Jira project management software that links a given issue to its resolution. It is a unique identifier that is used to reference the resolution of a specific issue, and allows for tracking and determining the success or failure of the resolution.`,
} ,
jira_current_sprint_fk:  {
  sql: `jira_current_sprint_fk`,
  type: `string`,
  description: `A foreign key in Jira is a custom field of type \"Select List (Cascading)\" that allows you to link a parent issue to one or more child issues. The current sprint option in Jira uses the foreign key field for linking issues and displaying the issues belonging to a particular sprint.`,
} ,
jira_external_reference_jira_fk:  {
  sql: `jira_external_reference_jira_fk`,
  type: `string`,
  description: `JIRA external reference JIRA foreign key is a feature that allows users to quickly and easily identify the relationship between records across their JIRA instances. The feature creates a numbered identifier for a given record and associates it with references on other JIRA instances. This feature allows organizations to maintain data integrity and keep a single source of truth across JIRA.`,
} ,
jira_issue_summary:  {
  sql: `jira_issue_summary`,
  type: `string`,
  description: `JIRA issue summary is a brief description of the issue that will help other people understand the issue more quickly. It should include the key problem statement and its context.`,
} ,
jira_issue_description:  {
  sql: `jira_issue_description`,
  type: `string`,
  description: `Jira issue description is a text field associated with an issue that provides a detailed description of the issue, including any supporting information needed to help explain, reproduce, and resolve the issue. This field should provide as much information as possible and should include screenshots, logs, and other supporting evidence where available.`,
} ,
jira_issue_project:  {
  sql: `jira_issue_project`,
  type: `string`,
  description: `Jira Issue Project is a feature within Jira that provides end users with an organized way to manage their projects and tasks. Jira Issue Project allows users to create projects, which contain different issues and tasks related to that project. It also frees users from managing individual tasks separately, as all relevant information (assigned users, deadlines, etc.) can be managed at the project level. Each project can also be customized with multiple options, such as project status tracking, categorization, and workflow.`,
} ,
jira_issue_assignee:  {
  sql: `jira_issue_assignee`,
  type: `string`,
  description: `Jira issue assignee is a person who has been assigned to handle and solve the issue. This could be a person who is responsible for managing the issue from start to finish or someone who is in charge of delegating the issue to the appropriate personnel.`,
} ,
jira_issue_reporter:  {
  sql: `jira_issue_reporter`,
  type: `string`,
  description: `Jira Issue Reporter is a GitHub app that automates the reporting of software issues from Jira to GitHub. It integrates with Jira to synchronize issues and connects with GitHub via its webhooks, enabling users to track and receive notifications when changes are made to an issue, use comments to discuss the issue and attachments are available in both systems. The app offers an automated synchronization between Jira and GitHub and allows users to select what issues should be synchronized.`,
} ,
jira_issue_priority:  {
  sql: `jira_issue_priority`,
  type: `string`,
  description: `In JIRA, an issue priority is a label that describes the importance or urgency of an issue. It helps users quickly assess how fundamental an issue is to a project's overall success. Common priorities include Critical, High, Medium, and Low.`,
} ,
jira_issue_creator:  {
  sql: `jira_issue_creator`,
  type: `string`,
  description: `Jira Issue Creator is an extension for Google Chrome that allows you to quickly create JIRA issues from any web page. It lets you save time by not having to log into JIRA and manually create a ticket. Issue Creator gives users the ability to quickly create new JIRA tickets easily by selecting the project and issue type and filling out the necessary fields.`,
} ,
jira_issue_issue_type:  {
  sql: `jira_issue_issue_type`,
  type: `string`,
  description: `Jira Issue Type is a way to categorize and organize issues in Jira. It is used to differentiate between different types of work, such as:

• Bug / Defect
• Story
• Task
• Improvement
• Epic
• Sub-task
• Change Request
• Risk`,
} ,
jira_issue_key:  {
  sql: `jira_issue_key`,
  type: `string`,
  description: `A Jira issue key is a unique identifier used to identify a specific issue or task in a Jira system. They typically consist of a project abbreviation followed by a hyphen and a numerical value. For example, ACC-123 is an example of a Jira issue key.`,
} ,
jira_issue_status_description:  {
  sql: `jira_issue_status_description`,
  type: `string`,
  description: `Jira issue status is a description of the issue's condition in the workflow. It is a description of the issue's current state and provides information about what action needs to taken next. Examples of issue statuses include “Open”, “In Progress”, “Resolved”, “Closed”, “Reopened”, and “On Hold”. Each status label explains the status of the issue and provides the appropriate next action.`,
} ,
jira_issue_status_name:  {
  sql: `jira_issue_status_name`,
  type: `string`,
  description: `Jira issue status names include:
Open,  In Progress, Reopened, Resolved, Closed, On Hold, Incomplete, and Duplicate.`,
} ,
jira_issue_status_stage:  {
  sql: `jira_issue_status_stage`,
  type: `string`,
  description: `The JIRA issue status stage is typically composed of seven stages: Open, In Progress, Reopened, Resolved, Closed, Incomplete, and Rejected. The status of the issue changes as it progresses through the steps of the issue lifecycle.`,
} ,
jira_issue_is_done:  {
  sql: `jira_issue_is_done`,
  type: `boolean`,
  description: `A Jira issue is considered done when it has been tested and closed as resolved. This will typically include the completion of tasks, acceptance of the feature or bug fix, or other activities that mark the end of the issue.`,
} ,
jira_issue_type:  {
  sql: `jira_issue_type`,
  type: `string`,
  description: `Jira issue types are the different types of issues you can log in Jira. Common issue types include tasks, bugs, stories, epics, and any custom issue type you might have created in your instance. Each issue type is designed to help organize and categorize your work.`,
} ,
jira_issue_parent_issue_type:  {
  sql: `jira_issue_parent_issue_type`,
  type: `string`,
  description: `In Jira, a parent issue type is a type of issue that can be assigned multiple subtasks to complete parts of the larger job. Sub-tasks are created to break down a complex task into more manageable chunks.`,
} ,
jira_issue_parent_issue_name:  {
  sql: `jira_issue_parent_issue_name`,
  type: `string`,
  description: `Jira does not have the concept of a \"parent issue\". However, Jira does have the concept of a \"sub-task\" which can connect an issue to another issue.`,
} ,
jira_issue_is_parent_epic:  {
  sql: `jira_issue_is_parent_epic`,
  type: `boolean`,
  description: `In JIRA, an Epic is a large body of work that can be broken down into smaller user stories and tasks. An Epic is a container for issues, used to organize them in a way that best reflects your workflow. An Issue is a unit of work within an Epic. It could be a feature, bug, or chore, and can be complicated or small. A Parent Epic is the highest-level Epic within a hierarchy of Epics and their related Issues.`,
} ,
jira_issue_resolution_type:  {
  sql: `jira_issue_resolution_type`,
  type: `string`,
  description: `Jira issue resolution types are the different ways an issue is marked as resolved. The most common resolution types are: Fixed, Duplicate, Incomplete, Won't Fix, Cannot Reproduce, Rejected, and Done.`,
} ,
jira_issue_status:  {
  sql: `jira_issue_status`,
  type: `string`,
  description: `Jira issue status is the current state of an issue. These statuses are generally used to indicate the progress of an issue or task throughout a workflow. Common Jira issue statuses include Open, In Progress, Resolved, and Closed.`,
} ,
jira_issue_conversation:  {
  sql: `jira_issue_conversation`,
  type: `string`,
  description: `Jira issue conversation is a feature of Jira that allows you to comment on a Jira issue and have conversations with other users about it. This can help to better explain an issue or problem, collaborate on finding a solution, and track progress or changes.`,
} ,
jira_issue_current_status:  {
  sql: `jira_issue_current_status`,
  type: `string`,
  description: `The current status of a Jira issue will depend on the workflow (process) defined for the issue and the current step or transition in that workflow. Typically, each step in the workflow will have an associated status such as \"To Do\", \"In Progress\", or \"Done\".`,
} ,
jira_issue_current_status_category:  {
  sql: `jira_issue_current_status_category`,
  type: `string`,
  description: `Jira issue status categories include:
• Open: The issue is new and is waiting for assignment or additional information before it can be worked on. 
• In Progress: The issue has been assigned and is actively being worked on. 
• Resolved: The issue has been resolved and the problem has been fixed. 
• Closed: The issue is closed, but can be reopened. 
• Reopened: The issue has been reopened and is ready to be worked on again.`,
} ,
jira_issue_current_priority:  {
  sql: `jira_issue_current_priority`,
  type: `string`,
  description: `The current priority of a Jira issue is based on its individual settings, which will vary from one case to the next. Generally speaking, the priority of an issue is determined by the urgency of its resolution, as determined by the project team who are managing the issue.`,
} ,
jira_issue_sprint:  {
  sql: `jira_issue_sprint`,
  type: `string`,
  description: `JIRA Issue Sprint is a feature of JIRA Software that allows teams to quickly organize, prioritize, and work on issues. The issue sprint is a way to keep track of who’s working on what, collaborate on tasks and discuss progress in real time. Teams can create sprints from any JIRA filter, assign work to team members, set deadlines, and monitor progress all in one place. With sprints, teams can stay on track for completing important tasks and Epic stories.`,
} ,
jira_issue_current_sprint_name:  {
  sql: `jira_issue_current_sprint_name`,
  type: `string`,
  description: `The name of the current sprint will vary depending on the Jira instance you're using. For example, if you're using an Agile project in Jira, you can view the current sprint name by navigating to the \"Agile\" > \"Active sprints\" tab.`,
} ,
jira_issue_is_active_sprint:  {
  sql: `jira_issue_is_active_sprint`,
  type: `boolean`,
  description: `Jira Issue is active sprint is when an issue is placed in an active sprint. This normally means that the issue has been taken on by a development team and is actively in the process of being addressed. Issues placed into an active sprint typically have a timeline associated with them and goals that must be reached before the issue can be considered complete and ready to be released.`,
} ,
jira_issue_fixes_versions:  {
  sql: `jira_issue_fixes_versions`,
  type: `string`,
  description: `Jira issue fixes versions are special releases or builds of the software that are intended solely to address bug fixes or other small enhancements. They are released in between major versions and are designed to provide bug fixes and minor updates without altering existing functionality in the existing major version.`,
} ,
jira_issue_sprint_started_at:  {
  sql: `jira_issue_sprint_started_at`,
  type: `time`,
  description: `Jira Issue Sprints are typically started at the beginning of a project or milestone. Depending on the size of the project, this could be at the beginning of a sprint, at the beginning of a project, or at a midpoint milestone.`,
} ,
jira_issue_sprint_ended_at:  {
  sql: `jira_issue_sprint_ended_at`,
  type: `time`,
  description: `The Sprint will officially end at the same day and time as defined in the Sprint goal. This end date is set at the beginning of the Sprint, and is detailed on the sprint's 'Plan' page in Jira.`,
} ,
jira_issue_sprint_completed_at:  {
  sql: `jira_issue_sprint_completed_at`,
  type: `time`,
  description: `A Jira issue sprint is completed when the team has completed all of the tasks and goals that were assigned during the sprint. The sprint is typically marked as complete when all tasks have been resolved, tested and approved. The sprint is then closed and the next sprint is started.`,
} ,
jira_issue_first_assigned_at:  {
  sql: `jira_issue_first_assigned_at`,
  type: `time`,
  description: `In Jira, an issue is first assigned to the project administrator, or to the issue creator if they are a project administrator. The project administrator then reviews the issue, sets any necessary labels or components, and assigns it to the best person to take it on.`,
} ,
jira_issue_last_assigned_at:  {
  sql: `jira_issue_last_assigned_at`,
  type: `time`,
  description: `Jira issues are assigned to users who are responsible for working on the project. The last person assigned to the issue can be seen in the Assignee field on the Jira issue page.`,
} ,
jira_issue_first_resolved_at:  {
  sql: `jira_issue_first_resolved_at`,
  type: `time`,
  description: `Jira issues can be resolved in a variety of ways, including through an automated process or by a team member manually. The exact moment when the issue is first resolved at can vary depending on the nature of the issue and how it is resolved.`,
} ,
jira_issue_status_category_changed_at_ts:  {
  sql: `jira_issue_status_category_changed_at_ts`,
  type: `time`,
  description: `Jira Issue Status Category changed at TS is a type of workflow transition. This is when a change is made to an issue's Status Category value, usually in response to additional information being made available or a certain criteria being met. This transition could mark an issue as 'done', 'in progress' or 'resolved'.`,
} ,
jira_issue_resolved_at_ts:  {
  sql: `jira_issue_resolved_at_ts`,
  type: `time`,
  description: `Jira Issue Resolved at TS is when a technical support specialist resolves an issue reported in Jira (an issue tracking software platform) for a customer or employee. This resolution could involve investigating the cause of the issue and then either fixing, changing, or providing a workaround for the issue.`,
} ,
jira_issue_last_viewed_at_ts:  {
  sql: `jira_issue_last_viewed_at_ts`,
  type: `time`,
  description: `Jira does not store information on \"last viewed\" times for issue records. The only way to obtain this kind of information is to look at the audit logs for the specific issue.`,
} ,
jira_issue_due_date_at_ts:  {
  sql: `jira_issue_due_date_at_ts`,
  type: `time`,
  description: `The Jira issue due date is determined by the assignee of that issue. The assignee can specify a due date, or the project administrator can set a default due date for all Jira issues.`,
} ,
jira_issue_created_at_ts:  {
  sql: `jira_issue_created_at_ts`,
  type: `time`,
  description: `Jira Issue Created at TS is a term used in Jira, which stands for Issue Created Time Stamp. This is the date and time a ticket is created in the Issue Tracking System. This is the very first entry in the Issue Tracking System and helps Jira users keep track of ticket changes over time.`,
} ,
jira_issue_updated_at_ts:  {
  sql: `jira_issue_updated_at_ts`,
  type: `time`,
  description: `JIRA Issue Updated At Ts is an automated field in JIRA that updates the issue with the exact timestamp when it was last updated. This field is typically displayed together with other issue information, like status, resolution, or assignee. It can be used to accurately track the progress of a given project or track issues resolved within a certain time frame.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_issues_sprint_bridge`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_issues_sprint_bridge`,
joins : {
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_issue_fk} = ${wh_delivery__jira_issues_fact.jira_issue_pk}`,
} ,
wh_delivery__jira_sprints_dim:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_sprint_fk} = ${wh_delivery__jira_sprints_dim.jira_sprint_pk}`,
} ,
},
dimensions: {
jira_issue_sprint_bridge_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_issue_sprint_bridge_pk`,
  description: `Jira Issue Sprint Bridge PK is an add-on for Jira Cloud and Jira Server. It provides project managers with a way to connect Jira issues to sprints, allowing teams to better coordinate their sprints and manage their back logs more efficiently. The add-on helps to bridge the gap between sprint planning and task execution, providing PMs and developers with an insight into which issues are associated with which sprint and what the progress of each issue is.`,
} ,
jira_issue_fk:  {
  sql: `jira_issue_fk`,
  type: `string`,
  description: `Jira Issue Foreign Key is a unique identifier for an issue in Jira, which can be used to reference it from other applications and databases. This key is also known as an issue number, and it's often used to reference the issue in conversations, emails, and other forms of communication.`,
} ,
jira_sprint_fk:  {
  sql: `jira_sprint_fk`,
  type: `string`,
  description: `Jira Sprint Foreign Key is a unique identifier for a Jira Sprint. It is an alphanumeric string of characters created by Jira when a sprint is created. Foreign Key can be used to keep track of different sprints and is also used to link sprints to related data in an external system.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_projects_fact`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_projects_fact`,
joins : {
wh_core__clients_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_project_pk} = ${wh_core__clients_bridge.jira_project_fk}`,
} ,
wh_delivery__jira_sprints_dim:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_project_pk} = ${wh_delivery__jira_sprints_dim.jira_project_fk}`,
} ,
},
dimensions: {
jira_project_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_project_pk`,
  description: `JIRA Project PK is a unique identifier that is assigned to a project in JIRA. It is used to uniquely identify the project in the system. It is a part of the URL when navigating to a project in JIRA.`,
} ,
jira_user_fk:  {
  sql: `jira_user_fk`,
  type: `string`,
  description: `A Jira user foreign key is a unique identifier that contains information related to a specific user who is accessing a Jira instance. It is used to link a user's data across different Jira instances or datastores. The value of the foreign key is typically an alphanumeric string and can be used to access user-specific data relative to their permissions.`,
} ,
jira_project_name:  {
  sql: `jira_project_name`,
  type: `string`,
  description: `A Jira project name is the name used to identify a specific project that is being managed through Jira. The project name typically reflects the project's purpose and or what is being worked on.`,
} ,
jira_project_description:  {
  sql: `jira_project_description`,
  type: `string`,
  description: `Jira is a project management and collaboration tool that helps teams manage and prioritize their work. It allows teams to create projects, assign tasks, track progress, and collaborate on and prioritize issues. Jira is widely used by organizations in a variety of industries, ranging from software development to IT operations, marketing, and more.`,
} ,
jira_project_key:  {
  sql: `jira_project_key`,
  type: `string`,
  description: `A Jira project key is a unique identifier for your Jira project. It is formed from the two or three letters that appear at the beginning of the issue key for all issues created within a single Jira project. For example, if you created an issue in a project called \"Project X\", its issue key might begin with \"PX-12345\". In this case, \"PX\" would be the project key.`,
} ,
jira_project_project_type_key:  {
  sql: `jira_project_project_type_key`,
  type: `string`,
  description: `The Jira Project Type Key is a unique identifier associated with a specific project type. It can be used to make queries to extract project-type-specific attributes and to quickly identify project types in a variety of contexts.`,
} ,
jira_project_epics:  {
  sql: `jira_project_epics`,
  type: `string`,
  description: `Jira Project Epics are features, stories or tasks that belong to a single project and can span multiple teams, departments, or business units. Epics can also be used to help break down a project into a set of manageable tasks. This allows project managers to better plan and execute a project, by visualizing and tracking the progress of their tasks.`,
} ,
jira_project_components:  {
  sql: `jira_project_components`,
  type: `string`,
  description: `Jira Project Components are the various parts that make up a Jira Project. Common components include Issue Types, Issue Statuses, Schemes, Reports, Dashboards, JQL Filters, and an Issue Collector. Components are customizable and can be used to allow teams to track the progress of a project and help manage workflow.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_sprints_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_sprints_dim`,
joins : {
wh_delivery__jira_issues_sprint_bridge:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_sprint_pk} = ${wh_delivery__jira_issues_sprint_bridge.jira_sprint_fk}`,
} ,
wh_core__sprints_bridge:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_sprint_pk} = ${wh_core__sprints_bridge.jira_sprint_fk}`,
} ,
},
dimensions: {
jira_sprint_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_sprint_pk`,
  description: `Jira Sprint PK is a new feature of Jira, which allows users to plan and track their sprints (short-term development cycles) more easily and efficiently. The feature provides users with a central hub for planning, tracking, and reporting on their sprints. It also allows users to monitor the progress of their sprints, view detailed reports, and visualize the data collected.`,
} ,
jira_project_fk:  {
  sql: `jira_project_fk`,
  type: `string`,
  description: `A Jira project foreign key is an unique identifier associated with a particular Jira project, which allows the project to be linked to other records in the Jira system.`,
} ,
jira_sprint_name:  {
  sql: `jira_sprint_name`,
  type: `string`,
  description: `In Jira, sprints are referred to as 'sprints'.`,
} ,
jira_sprint_goal:  {
  sql: `jira_sprint_goal`,
  type: `string`,
  description: `Jira Sprint Goals are objectives set by teams at the start of each sprint in order to provide focus and measure progress throughout the sprint. Sprint Goals are typically set collaboratively by the team in order to create alignment and understanding of the work being done over the sprint by all stakeholders. They can also provide a reference point to assess whether the sprint was successful after it is complete.`,
} ,
jira_sprint_state:  {
  sql: `jira_sprint_state`,
  type: `string`,
  description: `In Jira, a sprint is a period of time for completing a set of tasks. At the start of the sprint, tasks are chosen from the backlog list and their progress is tracked throughout the sprint. The sprint state indicates where a sprint is in its lifecycle, such as \"Active\", \"Completed\", or \"Cancelled\".`,
} ,
jira_start_at_date:  {
  sql: `jira_start_at_date`,
  type: `time`,
  description: `Jira start date refers to the date when a project, task, or issue was first created in Jira. This is usually the date when the item was first entered into the system and can often be different than the date when the item was actually started.`,
} ,
jira_complete_at_date:  {
  sql: `jira_complete_at_date`,
  type: `time`,
  description: `Jira Complete at Date is an Automation capability in Jira software that helps teams track and manage the progress of a project by enforcing due dates for items to be completed. It allows users to set global and individual due dates across multiple projects and teams, ensuring that deadlines are kept and projects move forward.`,
} ,
jira_end_at_date:  {
  sql: `jira_end_at_date`,
  type: `time`,
  description: `Jira end date is the completion date for a project, issue, or task. It is usually determined when the Jira project is created or when an issue or task is defined. It is important to have an end date that is realistic, achievable and allows for some flexibility.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
cube (`wh_delivery__jira_users_dim`, {
sql: `select * from lewis_analytics_dev.wh_delivery__jira_users_dim`,
joins : {
wh_delivery__jira_projects_fact:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_projects_fact.jira_user_fk}`,
} ,
wh_core__people_bridge:  {
  relationship: `belongsTo`,
  sql: `${CUBE.jira_user_pk} = ${wh_core__people_bridge.jira_user_fk}`,
} ,
wh_delivery__jira_issues_fact:  {
  relationship: `hasMany`,
  sql: `${CUBE.jira_user_pk} = ${wh_delivery__jira_issues_fact.jira_user_fk}`,
} ,
},
dimensions: {
jira_user_pk:  {
  primaryKey: true,
  type: `string`,
  sql: `jira_user_pk`,
  description: `Jira user primary keys are generated automatically by the Jira application and are used internally to identify the individual user. These keys consist of a combination of numeric and alphanumeric characters.`,
} ,
jira_user_name:  {
  sql: `jira_user_name`,
  type: `string`,
  description: `A Jira user name is the username you chose when signing up for your Jira account. It is typically an email address or a single word that acts as your personal identifier.`,
} ,
jira_user_email:  {
  sql: `jira_user_email`,
  type: `string`,
  description: `A Jira user email is the email address associated with a user's Jira account. This email address can be used to log into the user's Jira account.`,
} ,
jira_user_locale:  {
  sql: `jira_user_locale`,
  type: `string`,
  description: `Jira user locale is the language and date settings that a user can set as their preferred language, timezone and date format. This settings will determine how elements like dates and numbers appear to the user within Jira.`,
} ,
jira_user_time_zone:  {
  sql: `jira_user_time_zone`,
  type: `string`,
  description: `By default, the Jira user time zone will match the time zone settings of your operating system. However, users can also customize the time zone setting within the Jira application itself. This setting is found in the Personal Settings page and can be changed to any time zone listed.`,
} ,
jira_user_projects:  {
  sql: `jira_user_projects`,
  type: `string`,
  description: `Jira user projects are projects that are created by individual users for their own purposes. Projects are designed for tasks, issues, and other items that are specific to the user. They provide a way for individual users to organize and categorize their work, track progress, and collaborate with other users.`,
} ,
}});
