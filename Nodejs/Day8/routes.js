const express = require('express');
const router = express.Router();
const studentsrouets = require('../Day8/controller')
const std = require('./controller')

router.get('/name', studentsrouets.add);

module.exports = router;