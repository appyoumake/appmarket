/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('AccessGroup', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    groupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'Group',
        key: 'id'
      },
      field: 'group_id'
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      field: 'name'
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
      field: 'description'
    },
    enabled: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
      defaultValue: '1',
      field: 'enabled'
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
    tableName: 'access_group'
  });
};