# Description
(Please include a summary of the changes and motivate them.)

## Checklist
### Perform checks for each changed file
- [ ] Go easy on comments. If the code is obvious, don’t comment. Remove old, commented code
- [ ] Use two-space indentation
- [ ] Use each instead of for. Use unless instead of !if. However, if you need to involve an else to your conditional, never use unless-else. Use until instead of while! (negated condition).
- [ ] Use meaningful variable names.
- [ ] Use snake_case for methods and variables. Use snake_case for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase.). Always name your methods based on their behavior, not implementation.
- [ ] The names of predicate methods (methods that return a boolean value) should end in a question mark. Avoid prefixing predicate methods with the auxiliary verbs such as "is," "does," or "can." e.g., person.tall?
- [ ] Instance variables are defined using the single "at" sign (@) followed by a name. It is suggested that a lowercase letter should be used after the @.
- [ ] Global variable starts with a dollar ($) sign followed by other characters.
- [ ] Constants should be all upper case with words separated by underscores ('_').
- [ ] Table names have all lowercase letters and underscores between words; all table names must be plural noun, e.g., invoice_items, orders, etc.
- [ ] The model is named using the class naming convention of unbroken MixedCase and is always the singular of the table name, e.g., if the table name might be orders, the model name would be Order.
- [ ] Controller class names are pluralized, such that OrdersController would be the controller class for the orders table.
- [ ] The primary key of a table is assumed include the word "id" e.g., order_id
- [ ] The foreign key is named with the singular version of the target table name with id appended to it, e.g., order_id in the ITEMS table that links to the order_id in the ORDERS table.
- [ ] Tables used to join two tables in a many to many relationship is named using the table names they link, with the table names in alphabetical order, for example ITEMS_ORDERS
- [ ] Skinny Controllers, Fat models: best practice is to keep non-response related logic out of the controllers. Examples of code you don’t want in a controller are any business logic or persistence/model changing logic.
- [ ] Views should have very little ruby in them and certainly shouldn’t interact with the data repository (e.g., databases).
- [ ] Use def with parentheses when there are parameters. Omit the parentheses when the method doesn't accept any parameters
- [ ] Convention over Configuration - Use the Rails defaults
- [ ] Do not repeat yourself (DRY). Do whatever it takes to make sure that you don’t repeat yourself, avoiding duplication as much as you can. For example, use abstract classes, modules
- [ ] Smart use of Enums
- [ ] Use db:schema:load when creating the application database on a new system. Use db:migrate in all other cases when you need to apply the newly added migrations.
- [ ] Nested Resources/Routes: If you have a resource which belongs to another resource, then it’s a good idea to define the routes of the child resource nested within the routes of parent resource.

## Changes
(List changes, if any, that need to be made.)
