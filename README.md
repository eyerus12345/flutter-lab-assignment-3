# flutter_application_2

 1.Data Layer
Purpose:
    The Data Layer is responsible for accessing and managing data from remote sources (such as APIs). It contains services and repositories that handle HTTP requests and transform the raw response into usable model objects.

In This App:
    Communicates with the JSONPlaceholder API to fetch albums and photos.
    The ApiService handles HTTP requests.
    The AlbumRepository acts as a bridge between the Data Layer and the Business Logic Layer, providing a clean API for fetching data.

2.Business Logic Layer
Purpose:
    The Business Logic Layer manages the application's state and handles events, transforming them into states that the UI can react to. It isolates business rules from the UI and data access.

In This App:
    Implemented using the Bloc pattern.
    PhotoBloc and associated events/states manage how photo data is loaded and updated in the UI.
    It coordinates data fetching from the repository and emits appropriate states (e.g., loading, success, error).

3.Navigation Layer
Purpose:
    The Navigation Layer handles screen routing and user navigation flow within the app.

In This App:
    Uses GoRouter to define and manage routes.
    Allows users to navigate from the album list to the album detail screen by passing the albumId.

4.Presentation Layer
Purpose:
    The Presentation Layer is responsible for rendering the user interface and responding to state changes from the Business Logic Layer.

In This App:
    Composed of Flutter widgets (AlbumListView, AlbumDetailView, etc.).
    Listens to Bloc state changes to show loading indicators, data, or error messages.
    Displays albums and their photos in a visually attractive and user-friendly format.


##incase as privous project the sound of video is not work for this video this is the overall description of my flutter app!!!


