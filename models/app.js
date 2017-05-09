/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var App = sequelize.define('App', {
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
    packageId: {
      type: DataTypes.STRING(255),
      allowNull: true,
      unique: true,
      field: 'package_id'
    },
    mlabGuid: {
      type: DataTypes.STRING(255),
      allowNull: true,
      unique: true,
      field: 'mlab_guid'
    },
    name: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'name'
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: true,
      field: 'description'
    },
    keywords: {
      type: DataTypes.TEXT,
      allowNull: true,
      field: 'keywords'
    },
    category1: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'category1'
    },
    category2: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'category2'
    },
    category3: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'category3'
    },
    publisherOrgName: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'publisher_org_name'
    },
    state: {
      type: DataTypes.ENUM('published','unpublished','withdrawn'),
      allowNull: true,
      field: 'state'
    },
    size: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      defaultValue: '0',
      field: 'size'
    },
    icon: {
      type: "MEDIUMBLOB",
      allowNull: true,
      field: 'icon'
    }
  }, {
    tableName: 'app',
    underscored: true, 
    
    indexes: [
	    { fields: ['user_id'] },
	    { fields: ['name'] },
	    { fields: ['state'] },
	    { fields: ['category1'] },
	    { fields: ['category2'] },
	    { fields: ['category3'] },
      { type: 'FULLTEXT', fields: ['description'] },
      { type: 'FULLTEXT', fields: ['keywords'] }
    ],
    
		classMethods: {
      associate: function(models) {
        App.hasMany(models.Version, { foreignKey: 'appId'} );
        App.hasMany(models.Screenshot, { foreignKey: 'appId'} );
        App.belongsTo(models.User, { foreignKey: 'userId'} );
        App.belongsToMany(models.AccessGroup, { through: 'UsersAccessGroups', foreignKey: 'userId' });
      }
    }
  });
  
  return App;
};
