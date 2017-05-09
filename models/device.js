/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var Device = sequelize.define('Device', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    userId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      field: 'user_id'
    },
    uid: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'uid'
    },
    os: {
      type: DataTypes.STRING(25),
      allowNull: true,
      field: 'os'
    },
    osVersion: {
      type: DataTypes.STRING(25),
      allowNull: false,
      defaultValue: '1',
      field: 'os_version'
    },
    enabled: {
      type: DataTypes.INTEGER(1),
      allowNull: true,
      defaultValue: '1',
      field: 'enabled'
    },
    lastAccess: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'last_access'
    }
  }, {
    tableName: 'device',
    underscored: true,
    
    indexes: [
	    { fields: ['user_id'] },
	    { fields: ['uid'] },
	    { fields: ['os', 'os_version'] },
	    { fields: ['enabled'] },
	    { fields: ['last_access'] }
    ],
    
		classMethods: {
      associate: function(models) {
        Device.belongsTo(models.User, { foreignKey: 'userId'} );
        Device.hasMany(models.Token, { foreignKey: 'deviceId'} );
        Device.belongsToMany(models.Version, { through: 'DevicesVersions', foreignKey: 'versionId' });
      }
		}
  });
	
	return Device;
};
