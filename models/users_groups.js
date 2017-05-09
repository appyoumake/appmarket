/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var UsersGroups = sequelize.define('UsersGroups', {
    userId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'user_id'
    },
    groupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'group_id'
    }
  }, {
    tableName: 'users_groups',
    underscored: true,
      
    indexes: [
	    { fields: ['user_id'] },
	    { fields: ['group_id'] }
    ]
});
  
  return UsersGroups;
};
