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
      references: {
        model: 'Device',
        key: 'id'
      },
      field: 'device_id'
    },
    token: {
      type: DataTypes.STRING(255),
      allowNull: true,
      field: 'token'
    },
		createdAt: {
      type: DataTypes.TIME,
      allowNull: true,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'created_at'
    },
    expires: {
      type: DataTypes.TIME,
      allowNull: true,
      defaultValue: sequelize.literal('CURRENT_TIMESTAMP'),
      field: 'expires'
    }
  }, {
    tableName: 'token',
		classMethods: {
      associate: function(models) {
        Token.belongsTo(models.Device, { foreignKey: 'deviceId'} );
      }
		}
  });
  return Token;
};
