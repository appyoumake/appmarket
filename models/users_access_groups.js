/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var UsersAccessGroups = sequelize.define('UsersAccessGroups', {
    userId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'user_id'
    },
    accessGroupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'access_group_id'
    }
  }, {
    tableName: 'users_access_groups',
    underscored: true,
    
    indexes: [
	    { fields: ['user_id'] },
	    { fields: ['access_group_id'] }
    ]
    
  });
  
  return UsersAccessGroups;
};
