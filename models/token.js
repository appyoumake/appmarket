/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  var Token = sequelize.define('Token', {
    id: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true,
      field: 'id'
    },
    deviceId: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      field: 'device_id'
    },
    token: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'token'
    },
    expires: {
      type: DataTypes.DATE,
      allowNull: true,
      field: 'expires'
    }
  }, {
    tableName: 'token',
    underscored: true,
    
    indexes: [
	    { fields: ['device_id'] },
      { fields: ['expires'] }
    ],
    
		classMethods: {
      associate: function(models) {
        Token.belongsTo(models.Device, { foreignKey: 'deviceId'} );
      }
		}
  });
  return Token;
};
