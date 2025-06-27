# Application Data Model Notes

This document outlines the data model for the application, based on discussions about the different entities and their relationships.

**Updated:** [Insert Date and Time Here - e.g., 2023-10-27 10:30 AM PST]

## Core Concepts

*   **User Roles:** The application supports three main user roles: Customer, Vendor, and Admin.
*   **Offerings:** The central entity representing products or services provided by Vendors, which can be reviewed by Customers.
*   **Promotions:** Applied to Offerings to provide special deals to Customers.
*   **Audit Logs:** To track changes and actions within the application.

## Data Models

### 1. User

*   **Description:** Represents a base user account with authentication details and role.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`email\` (String, Unique)
    *   \`password\` (String, Hashed) - Note: Customer, Vendor, and Admin are all types of Users, inheriting these base attributes.
    *   \`role\` (Enum/String: \`Customer\`, \`Vendor\`, \`Admin\`)

### 2. Customer

*   **Description:** Represents a customer user.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`userId\` (Foreign Key referencing User)
    *   \`name\` (String)
    *   \`contactInformation\` (String)
    *   *(Potentially loyalty points, purchase history summary)*

### 3. Vendor

*   **Description:** Represents a vendor user who provides offerings.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`userId\` (Foreign Key referencing User)
    *   \`name\` (String)
    *   \`contactInformation\` (String)
    *   \`addressId\` (Foreign Key referencing Address)
    *   *(Potentially vendor rating, business type)*

### 4. Admin

*   **Description:** Represents an administrator user with elevated privileges.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`userId\` (Foreign Key referencing User)
    *   *(Potentially specific admin roles or permissions)*

### 5. Address

*   **Description:** Represents a physical address.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`street\` (String)
    *   \`city\` (String)
    *   \`stateProvince\` (String)
    *   \`postalCode\` (String)
    *   \`country\` (String)

### 6. Offering

*   **Description:** Represents a product or service offered by a Vendor. This is a key entity.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`vendorId\` (Foreign Key referencing Vendor)
    *   \`name\` (String)
    *   \`description\` (String)
    *   \`categoryId\` (Foreign Key referencing Category, if Category model exists)
    *   \`price\` (Decimal/Double)
    *   \`minimumUnit\` (Integer/Decimal, depending on the offering)
    *   \`attributes\` (JSON/Map/List of Key-Value Pairs - flexible storage for specific details)
    *   \`imageUrls\` (List of Strings - URLs or paths to images)
    *   \`availability\` (JSON/Map - e.g., daily hours, specific dates)
    *   \`status\` (Enum/String: \`Available\`, \`OutOfStock\`, \`Paused\`, etc.)
*   **Relationships:**
    *   Belongs to one Vendor.
    *   Can be linked to multiple Promotions.
    *   Can be associated with a Category.

### 7. Promotion

*   **Description:** Represents a special offer or discount applicable to Offerings.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`offeringId\` (Foreign Key referencing Offering)
    *   \`code\` (String, Unique)
    *   \`description\` (String)
    *   \`discountType\` (Enum/String: \`Percentage\`, \`FixedAmount\`)
    *   \`discountValue\` (Decimal/Double)
    *   \`startDate\` (DateTime)
    *   \`endDate\` (DateTime)
    *   *(Potentially usage limits, terms and conditions)*
*   **Relationships:**
    *   Applies to one or more Offerings.

### 8. Booking

*   **Description:** Represents a customer's reservation or purchase of an Offering.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`customerId\` (Foreign Key referencing Customer)
    *   \`offeringId\` (Foreign Key referencing Offering)
    *   \`vendorId\` (Foreign Key referencing Vendor)
    *   \`bookingDate\` (DateTime)
    *   \`status\` (Enum/String: \`Pending\`, \`Confirmed\`, \`Cancelled\`, \`Completed\`)
    *   \`totalPrice\` (Decimal/Double)
    *   *(Potentially payment status, special requests)*
*   **Relationships:**
    *   Belongs to one Customer.
    *   References one Offering and one Vendor.

### 9. Review

*   **Description:** Represents a customer's feedback or rating for an Offering.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`customerId\` (Foreign Key referencing Customer)
    *   \`offeringId\` (Foreign Key referencing Offering)
    *   \`rating\` (Integer/Decimal) - e.g., 1-5 stars
    *   \`comment\` (String)
    *   \`reviewDate\` (DateTime)
    *   *(Potentially vendor response)*
*   **Relationships:**
    *   Belongs to one Customer.
    *   Applies to one Offering.

### 10. Customer Preferences

*   **Description:** Stores preferences specific to a customer.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`customerId\` (Foreign Key referencing Customer)
    *   \`preferredCategories\` (List of Strings or Foreign Keys referencing Category)
    *   \`communicationPreferences\` (JSON/Map - e.g., email notifications, push notifications)
    *   *(Potentially location preferences, dietary restrictions)*
*   **Relationships:**
    *   Belongs to one Customer.

### 11. Vendor Preferences

*   **Description:** Stores preferences and settings specific to a vendor.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`vendorId\` (Foreign Key referencing Vendor)
    *   \`businessHours\` (Map<String, dynamic>) - e.g., {"Monday": "9 AM - 5 PM"}
    *   \`serviceArea\` (String or GeoJSON)
    *   \`paymentMethods\` (List of Strings)
    *   *(Potentially booking policies, cancellation policies)*
*   **Relationships:**
    *   Belongs to one Vendor.

### 12. Admin Settings

*   **Description:** Stores global settings for the application managed by administrators.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`maintenanceMode\` (Boolean)
    *   \`newUserApprovalRequired\` (Boolean)
    *   \`commissionRate\` (Decimal/Double)
    *   *(Potentially third-party service API keys, feature flags)*

### 13. Category

*   **Description:** Represents categories for organizing Offerings.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`name\` (String)
    *   *(Potentially icons or images for categories)*
*   **Relationships:**
    *   Can have many Offerings.

### 14. Audit Log

*   **Description:** Records actions and changes within the application for security, compliance, and debugging.
*   **Attributes:**
    *   \`id\` (Unique Identifier)
    *   \`userId\` (String) - The ID of the user who performed the action.
    *   \`userRole\` (String) - The role of the user who performed the action.
    *   \`action\` (String) - A description of the action performed.
    *   \`entityType\` (String) - The type of entity affected by the action.
    *   \`entityId\` (String) - The ID of the entity affected by the action.
    *   \`timestamp\` (DateTime) - The date and time when the action occurred.
    *   \`details\` (Map<String, dynamic>) - Optional. Additional details about the action.
    *   \`ipAddress\` (String) - Optional. The IP address from which the action was performed.
*   **Relationships:**
    *   Associated with a User.
