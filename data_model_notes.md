# Application Data Model Notes

This document outlines the data model for the application, based on discussions about the different entities and their relationships.

## Core Concepts

*   **User Roles:** The application supports three main user roles: Customer, Vendor, and Admin.
*   **Offerings:** The central entity representing products or services provided by Vendors, which can be reviewed by Customers.
*   **Promotions:** Applied to Offerings to provide special deals to Customers.

## Data Models

### 1. User

*   **Description:** Represents a base user account with authentication details and role.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `email` (String, Unique)
    *   `password` (String, Hashed) - Note: Customer, Vendor, and Admin are all types of Users, inheriting these base attributes.
    *   `role` (Enum/String: `Customer`, `Vendor`, `Admin`)

### 2. Customer

*   **Description:** Represents a customer, linked to a User account, with customer-specific information.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `userId` (Foreign Key referencing User)
    *   `name` (String)
    *   `contactInformation` (String, e.g., phone number)
    *   *(Potentially other customer-specific attributes)*
*   **Relationships:**
    *   Has one User.
    *   Has one CustomerPreferences.
    *   Has many Bookings.
    *   Has many Reviews.

### 3. Vendor

*   **Description:** Represents a vendor, linked to a User account, with business-specific information.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `userId` (Foreign Key referencing User)
    *   `businessName` (String)
    *   `contactInformation` (String, e.g., phone number, business email)
    *   `addressId` (Foreign Key referencing Address, for business location)
    *   *(Potentially other vendor-specific attributes)*
*   **Relationships:**
    *   Has one User.
    *   Has one VendorPreferences.
    *   Has many Offerings.
    *   Has many Promotions.

### 4. Admin

*   **Description:** Represents an administrator, linked to a User account, with privileges to manage the application.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `userId` (Foreign Key referencing User)
    *   `name` (String, optional)
    *   *(Potentially other admin-specific attributes)*
*   **Relationships:**
    *   Has one User.
    *   Has one AdminSettings.

### 5. Address

*   **Description:** Represents a physical address.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `street` (String)
    *   `city` (String)
    *   `stateProvince` (String)
    *   `postalCode` (String)
    *   `country` (String)
    *   *(Potentially latitude and longitude for mapping)*
*   **Relationships:**
    *   Can be associated with Users (for billing/shipping).
    *   Can be associated with Vendors.
    *   (Can be associated with Users or Offerings if needed)

### 6. Offering

*   **Description:** Represents a product or service offered by a Vendor. This is a key entity.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `vendorId` (Foreign Key referencing Vendor)
    *   `name` (String)
    *   `description` (String)
    *   `categoryId` (Foreign Key referencing Category, if Category model exists)
    *   `price` (Decimal/Double)
    *   `minimumUnit` (Integer/Decimal, depending on the offering)
    *   `attributes` (JSON/Map/List of Key-Value Pairs - flexible storage for specific details)
    *   `imageUrls` (List of Strings - URLs or paths to images)
    *   `availability` (JSON/Map - e.g., daily hours, specific dates)
    *   `status` (Enum/String: `Available`, `OutOfStock`, `Paused`, etc.)
*   **Relationships:**
    *   Belongs to one Vendor.
    *   Can be linked to multiple Promotions.

### 7. Promotion

*   **Description:** Represents a special offer or deal that can be applied to Offerings. Flexible to handle different types.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `vendorId` (Foreign Key referencing Vendor)
    *   `title` (String)
    *   `description` (String)
    *   `startDate` (Date/DateTime)
    *   `endDate` (Date/DateTime)
    *   `promotionType` (Enum/String: `discount`, `bogo`, `free_shipping`, `bundle_deal`, etc.) - Defines the nature of the promotion.
    *   `discountValue` (Decimal/Integer) - Meaning depends on `promotionType`. (e.g., percentage for `discount`, quantity for `bogo`)
    *   `minimumPurchaseAmount` (Decimal/Double, Optional)
    *   `applicableOfferingIds` (List of Foreign Keys referencing Offering) - Offerings this promotion applies to.
    *   `termsAndConditions` (String)
    *   `status` (Enum/String: `Active`, `Upcoming`, `Expired`, `Paused`)
    *   `isActive` (Boolean) - Toggled by the Vendor to control visibility and applicability.
*   **Handling Different Promotion Types:** The `promotionType` attribute dictates how the `discountValue` and other attributes are interpreted and applied in the application logic.
*   **Promotion Listing:** Promotions displayed to customers should be filtered based on `startDate`, `endDate`, and the `isActive` status being true.

### 8. Customer Preferences

*   **Description:** Stores preferences specific to a Customer.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `customerId` (Foreign Key referencing Customer)
    *   `preferredCategories` (List of Strings/Foreign Keys referencing Category)
    *   `locationPreferences` (e.g., preferred cities/areas, radius)
    *   `notificationSettings` (Boolean flags for different types of notifications)
    *   *(Potentially other customer preferences)*
*   **Relationships:**
    *   Belongs to one Customer.

### 9. Vendor Preferences

*   **Description:** Stores operational preferences for a Vendor.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `vendorId` (Foreign Key referencing Vendor)
    *   `businessHours` (JSON/Map representing daily hours)
    *   `serviceArea` (e.g., list of supported locations, radius)
    *   `paymentMethods` (List of accepted payment methods)
    *   *(Potentially other vendor preferences)*
*   **Relationships:**
    *   Belongs to one Vendor.

### 10. Admin Settings

*   **Description:** Stores application-wide configuration settings manageable by an Admin.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `adminId` (Foreign Key referencing Admin) - or could be a singleton model not linked to a specific admin.
    *   `commissionRate` (Decimal/Double)
    *   `userManagementSettings` (e.g., ability to approve/decline vendor registrations)
    *   `contentModerationSettings`
    *   *(Other system configuration settings)*
*   **Relationships:**
    *   Linked to the Admin role or is a global setting.

### 11. Category (Optional)

*   **Description:** Represents categories for organizing Offerings.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `name` (String)
    *   *(Potentially icons or images for categories)*
*   **Relationships:**
    *   Can have many Offerings.

### 12. Booking

*   **Description:** Represents a customer's booking of a Promotion, leading to a potential transaction with a Vendor. Bookings have a limited validity period.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `customerId` (Foreign Key referencing Customer)
    *   `promotionId` (Foreign Key referencing Promotion)
    *   `bookingTime` (DateTime) - The time the booking was made.
    *   `expirationTime` (DateTime) - The time the booking expires, calculated based on `bookingTime` and an Admin-set validity duration (from Admin Settings).
    *   `qrCode` (String) - A unique identifier for the booking used for validation.
    *   `status` (Enum/String: `Active`, `Expired`, `Validated`, `Cancelled`)
    *   `validationTime` (DateTime, Optional) - The time the booking was validated by the Vendor.
    *   `validatedByVendorId` (Foreign Key referencing Vendor, Optional) - The Vendor who validated the booking.
*   **Relationships:**
    *   Belongs to one Customer.
    *   Belongs to one Promotion.
*   **Booking Validation:** Customers will display a QR code representing their active booking. Vendors will scan this QR code using their application to validate the booking. Successful validation changes the booking status to `Validated` and marks the transaction as closed.

### 13. Review

*   **Description:** Represents a customer's review and rating for an Offering they have experienced through a booking.
*   **Attributes:**
    *   `id` (Unique Identifier)
    *   `customerId` (Foreign Key referencing Customer)
    *   `offeringId` (Foreign Key referencing Offering)
    *   `bookingId` (Foreign Key referencing Booking, Optional) - Links the review to a specific booking if applicable.
    *   `rating` (Integer) - Rating on a scale of 1 to 7.
    *   `reviewText` (String, Optional) - The customer's written feedback.
    *   `reviewTime` (DateTime) - The time the review was submitted.
*   **Relationships:**
    *   Belongs to one Customer.
    *   Belongs to one Offering.
    *   (Optionally) Belongs to one Booking.

## Relationships Summary

*   User has one (Customer OR Vendor OR Admin).
*   Customer has one CustomerPreferences.
*   Vendor has one VendorPreferences.
*   Vendor has many Offerings.
*   Vendor has many Promotions.
*   Offering belongs to one Vendor.
*   Offering has many Reviews.
*   Promotion can be linked to many Offerings.
*   Address can be linked to User roles (especially Vendor).
*   Admin has one AdminSettings (or AdminSettings is a global singleton).
*   Category (if exists) has many Offerings.
*   Customer has many Bookings.
*   Booking belongs to one Customer.
*   Booking belongs to one Promotion.
*   Customer has many Reviews.

This data model provides a structured approach to managing the information within your application. Remember that this is a starting point and may evolve as you further develop the application.