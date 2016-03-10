Permission Framework Architecture
---------------------------------
 * There is a fixed known set of permissions
 * Each permission is stored as permission record in the databases
 * Permission Framework utilizes User, Role and Permission Models
 * User can have many roles and a role can belong to many users
 * Role can have many permissions and permission can belong to many roles
 * An authorized user can create roles and assign permissions to the role but cannot create a new permission
 * An authorized user can also assign the roles to a user

**Role Model**

    name: string
    description: text
**Permission Model**

    title: string
    action: string
    subject: string

Permissions are loaded into the database using a rake task