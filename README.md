# StudySphere - Online Learning Community

StudySphere is an interactive online learning community platform built using Python and Django. It is designed to facilitate discussions, resource sharing, and collaboration among users in a Reddit-style environment. The application provides features for user registration, room creation for discussions on various topics, and a platform for users to share and exchange knowledge.

StudySphere is a Django-based web application that serves as an online learning community. Users can register, create discussion rooms, participate in conversations, and share knowledge and resources. The app allows users to create profiles, follow topics of interest, and interact with other members in real-time. With a user-friendly interface, StudySphere encourages collaboration and learning through active participation in discussions.

## Features
- User Authentication: Registration, login, and logout functionality.
- User Profiles: Each user has a profile with personal information and an avatar.
- Room Creation and Management: Users can create, update, and delete discussion rooms.
- Topic Management: Organize rooms under specific topics.
- Messaging System: Users can post and delete messages within rooms.
- Activity Feed: Display recent activity and interactions.
- REST API: Access to rooms and room details through API endpoints.
- Media Support: Users can upload avatars and other media files.
  
## Technologies Used
- Backend: Django
- Frontend: HTML, CSS, JavaScript (templating with Django)
- Database: SQLite (default Django setup)
- APIs: Django REST Framework for building APIs
- User Authentication: Django's built-in authentication system
- Image Handling: Django's built-in support for media files
- Templating: Django's templating engine

## Usage
- Home Page: Displays the list of available rooms and recent activity.
- User Registration: Users can sign up for a new account.
- Login: Registered users can log in to access features.
- Room Creation: Logged-in users can create new discussion rooms.
- Messaging: Users can post messages in rooms and interact with other participants.
- Profile Management: Users can update their profile details and upload avatars.
- Admin Panel: Access via /admin/ to manage users, rooms, and topics (requires superuser access).

## API Endpoints
  StudySphere includes REST API endpoints for accessing room data. These endpoints are useful for integrating with other services or building a separate frontend.

- GET /api/: Lists all available API routes.
- GET /api/rooms/: Retrieves a list of all discussion rooms.
- GET /api/rooms/<str:pk>/: Retrieves details of a specific room by its ID.

## Models
### User Model
Custom user model extending AbstractUser:

- name: CharField for the user's name.
- email: Unique email field used for authentication.
- bio: TextField for user's bio information.
- avatar: ImageField for user profile picture.
  
### Topic Model
Represents discussion topics:

- name: CharField for the topic's name.

### Room Model
Represents a discussion room:

- host: ForeignKey linking to the User model.
- topic: ForeignKey linking to the Topic model.
- name: CharField for the room's name.
- description: TextField for room description.
- participants: ManyToManyField linking to users.
- updated: DateTimeField to track the last update.
- created: DateTimeField for the creation time.
  
### Message Model
Represents messages within rooms:

- user: ForeignKey linking to the User model.
- room: ForeignKey linking to the Room model.
- body: TextField for the message content.
- updated: DateTimeField to track the last update.
- created: DateTimeField for the creation time.

