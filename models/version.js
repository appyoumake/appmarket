/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var Version = sequelize.define('Version', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    appId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      field: 'app_id'
    },
    userId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      field: 'user_id'
    },
    supercededByVersionId: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      field: 'superceded_by_version_id'
    },
    version: {
      type: DataTypes.STRING(25),
      allowNull: false,
      defaultValue: '1.0.0',
      field: 'version'
    },
    updateNotes: {
      type: DataTypes.TEXT,
      allowNull: true,
      field: 'update_notes'
    },
    os: {
      type: DataTypes.STRING(25),
      allowNull: false,
      field: 'os'
    },
    osVersion: {
      type: DataTypes.STRING(25),
      allowNull: false,
      defaultValue: '1',
      field: 'os_version'
    },
    downloadCount: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      defaultValue: '0',
      field: 'download_count'
    },
    state: {
      type: DataTypes.ENUM('waiting_for_file','ready','superceded'),
      allowNull: true,
      field: 'state'
    }
  }, {
    tableName: 'version',
    underscored: true,
    
    indexes: [
	    { fields: ['user_id'] },
	    { fields: ['app_id'] },
	    { fields: ['superceded_by_version_id'] },
	    { fields: ['version'] }
    ],
    
		classMethods: {
      associate: function(models) {
        Version.belongsTo(models.User, { foreignKey: 'userId'} );
        Version.belongsTo(models.App, { foreignKey: 'appId'} );
        Version.belongsToMany(models.Device, { through: 'DevicesVersions', foreignKey: 'deviceId' });
      }
		}
  });
  
  return Version;
};
