/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var DevicesVersions = sequelize.define('DevicesVersions', {
    deviceId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'Device',
        key: 'id'
      },
      field: 'device_id'
    },
    versionId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'Version',
        key: 'id'
      },
      field: 'version_id'
    },
    state: {
      type: DataTypes.ENUM('unknown','downloaded','used','uninstalled'),
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
    }
  }, {
    tableName: 'devices_versions'
  });
  
  return DevicesVersions;
};
