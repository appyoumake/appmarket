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
      field: 'email'
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
      type: DataTypes.STRING(20),
      allowNull: true,
      defaultValue: 'user',
      field: 'role'
    },
    state: {
      type: DataTypes.ENUM('registered','accepted','rejected','disabled'),
      allowNull: true,
      field: 'state'
    },
    createdAt: {
      type: DataTypes.TIME,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'created_at'
    },
    updatedAt: {
      type: DataTypes.TIME,
      allowNull: false,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'updated_at'
    },
    deletedAt: {
      type: DataTypes.TIME,
      allowNull: true,
      field: 'deleted_at'
    }
  }, {
    tableName: 'usr', 
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
