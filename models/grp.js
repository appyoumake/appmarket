/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var Group = sequelize.define('Group', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: true,
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
    tableName: 'grp',
    underscored: true,
    
    indexes: [
	    { fields: ['enabled'] }
    ],
    
		classMethods: {
      associate: function(models) {
        Group.belongsToMany(models.User, {through: 'UsersGroups', foreignKey: 'groupId'});
        Group.hasMany(models.AccessGroup, { foreignKey: 'groupId'} );
      }
		}
  });
  
  return Group;
};
