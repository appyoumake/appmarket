/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('AppsAccessGroups', {
    appId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'App',
        key: 'id'
      },
      field: 'app_id'
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
    tableName: 'apps_access_groups'
  });
};
