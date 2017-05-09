/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var AccessGroup = sequelize.define('AccessGroup', {
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
    }

  }, {
    tableName: 'access_group',
    underscored: true,
    
    indexes: [
	    { fields: ['group_id'] },
	    { fields: ['name'] },
	    { fields: ['enabled'] }
    ],
    
		classMethods: {
      associate: function(models) {
        AccessGroup.belongsTo(models.Group, { foreignKey: 'groupId'} );
        AccessGroup.belongsToMany(models.User, { through: 'UsersAccessGroups', foreignKey: 'accessGroupId' });
        AccessGroup.belongsToMany(models.App, { through: 'AppsAccessGroups', foreignKey: 'accessGroupId' });
      }
		}
  });
  
  return AccessGroup;
};
