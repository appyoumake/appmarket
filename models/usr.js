/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var User = sequelize.define('User', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: true,
      field: 'email',
      validate: { isEmail: true }
    },
    firstName: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'first_name'
    },
    lastName: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'last_name'
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'password'
    },
    salt: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'salt'
    },
    role: {
      type: DataTypes.ENUM('ROLE_USER','ROLE_ADMIN','ROLE_SUPER_ADMIN'),
      allowNull: true,
      defaultValue: 'ROLE_USER',
      field: 'role'
    },
    state: {
      type: DataTypes.ENUM('registered','active','inactive','rejected','disabled'),
      allowNull: true,
      field: 'state'
    },
    lastAccess: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'last_access'
    },
    deletedAt: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'deleted_at'
    }
  }, {
    tableName: 'usr',
    underscored: true, 
    
    indexes: [
	    { fields: ['last_name'] },
	    { fields: ['first_name'] },
	    { fields: ['role'] },
	    { fields: ['state'] },
	    { fields: ['last_access'] },
	    { fields: ['deleted_at'] }
    ],
    
		classMethods: {
      associate: function(models) {
        User.hasMany(models.Device, { foreignKey: 'userId'} );
        User.hasMany(models.Version, { foreignKey: 'userId'} );
        User.hasMany(models.App, { foreignKey: 'userId'} );
        User.belongsToMany(models.Group, { through: 'UsersGroups', foreignKey: 'userId' });
        User.belongsToMany(models.AccessGroup, { through: 'UsersAccessGroups', foreignKey: 'userId' });
      }
    }
  });
	
	return User;
};
