const bcrypt = require('bcryptjs');
const helpers = {};

// Encriptación de password
helpers.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10);
    const cryptPass = await bcrypt.hash(password, salt);
    return cryptPass;
};

// Comparación de password con la encriptada
helpers.matchPass = async (password, cryptPass) => {
    try {
        return await bcrypt.compare(password, cryptPass);
    } catch (error) {
        console.log(error);
    }
    
};




module.exports = helpers;