/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var AppsAccessGroups = sequelize.define('AppsAccessGroups', {
    appId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'app_id'
    },
    accessGroupId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      field: 'access_group_id'
    }

  }, {
    tableName: 'apps_access_groups',
    underscored: true,
    
    indexes: [
	    { fields: ['app_id'] },
	    { fields: ['access_group_id'] }
    ]
    
  });
  
  return AppsAccessGroups;
};
