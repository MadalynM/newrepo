const invModel = require("../models/inventory-model")
const utilities = require("../utilities/")

const invCont = {}

/* ***************************
 *  Build inventory by classification view
 * ************************** */
invCont.buildByClassificationId = async function (req, res, next) {
  const classification_id = req.params.classificationId
  const data = await invModel.getInventoryByClassificationId(classification_id)
  const grid = await utilities.buildClassificationGrid(data)
  let nav = await utilities.getNav()
  const className = data[0].classification_name
  res.render("./inventory/classification", {
    title: className + " Vehicles",
    nav,
    grid,
  })
}

/* *****************************
 * Build detail view
 * ****************************/
invCont.buildDetailView = async function (req, res, next) {//
  const inv_id = req.params.inventoryId//
  const info = await invModel.getSpecificVehicle(inv_id)//
  const detail = await utilities.buildDetailGrid(info)//
  const invMake = info.inv_make//
  const invMod = info.inv_model//
  res.render("./inventory/detail", {//
    detail_title: invMake + invMod,//
    detail,//
  })//
}//

module.exports = invCont