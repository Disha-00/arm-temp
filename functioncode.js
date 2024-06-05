const axios = require('axios');

module.exports = async function (context, req) {
    const response = await axios.post('https://api.fabric.microsoft.com/v1/workspaces', {
        // Your API payload
    });

    context.res = {
        status: response.status,
        body: response.data
    };
};
