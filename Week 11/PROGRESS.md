# Progress

## Achieved So Far

- Built the main Flutter app structure with screens for login, registration, home, reports, report details, profile, creating reports, editing reports, and viewing my reports.
- Added Firebase Authentication with email and password sign up, login, logout, and auth-state routing.
- Added Cloud Firestore support through `ReportService`.
- Added create, read, update, and delete support for reports.
- Added owner-only edit and delete actions using the current Firebase Auth UID.
- Added My Reports filtering by the logged-in user's UID.
- Added image picking from gallery, camera capture, preview, and local on-device image storage.
- Added location support using Geolocator with permission handling and friendly error messages.
- Added unit and widget tests for the report model, validation, report cards, and empty states.

## Optional Extensions

- Add dedicated staff/admin workflows for assignment queues.
- Add report comments or a detailed status timeline.
- Add a map view for coordinates.
- Add reverse geocoding to suggest a readable location name from GPS.
- Add image compression and cleanup for locally stored images.
- Add Firebase Storage upload support if billing/storage setup is available.
- Add stronger Firebase Security Rules before production deployment.
- Add more tests for editing, deleting, and authenticated report flows.

## Out of Scope

- Real-time staff dispatch or emergency response.
- Push notifications.
- In-app chat between students and staff.
- Advanced analytics dashboards.
- Offline-first syncing.
- Payment, booking, or student identity verification integrations.
