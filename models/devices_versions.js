/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var DevicesVersions = sequelize.define('DevicesVersions', {
    deviceId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'device_id'
    },
    versionId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'version_id'
    },
    state: {
      type: DataTypes.ENUM('unknown','downloaded','used','uninstalled'),
      allowNull: true,
      field: 'state'
    }
  }, {
    tableName: 'devices_versions',
    underscored: true,
    
    indexes: [
	    { fields: ['device_id'] },
	    { fields: ['version_id'] },
	    { fields: ['state'] }
    ]
    
  });
  
  return DevicesVersions;
};
