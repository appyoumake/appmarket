/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('Screenshot', {
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
      references: {
        model: 'App',
        key: 'id'
      },
      field: 'app_id'
    },
    image: {
      type: "MEDIUMBLOB",
      allowNull: true,
      field: 'image'
    },
    mimetype: {
      type: DataTypes.STRING(50),
      allowNull: true,
      field: 'mimetype'
    },
    size: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      field: 'size'
    }
  }, {
    tableName: 'screenshot'
  });
};
