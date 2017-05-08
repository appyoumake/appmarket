/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var UsersAccessGroups = sequelize.define('UsersAccessGroups', {
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
    accessGroupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'AccessGroup',
        key: 'id'
      },
      field: 'access_group_id'
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
    }
  }, {
    tableName: 'users_access_groups'
  });
  
  return UsersAccessGroups;
};
