/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var UsersGroups = sequelize.define('UsersGroups', {
    userId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'User',
        key: 'id'
      },
      field: 'user_id'
    },
    groupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'Group',
        key: 'id'
      },
      field: 'group_id'
    }
  }, {
    tableName: 'users_groups'
  });
  
  return UsersGroups;
};
