const fz = require('zigbee-herdsman-converters/converters/fromZigbee');
const tz = require('zigbee-herdsman-converters/converters/toZigbee');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const reporting = require('zigbee-herdsman-converters/lib/reporting');
const extend = require('zigbee-herdsman-converters/lib/extend');
const e = exposes.presets;
const ea = exposes.access;

const definition = {
    zigbeeModel: ['SIREN001'], 
    model: 'SIREN001', 
    vendor: 'LDS', 
    description: 'Hive Smart Siren',
    fromZigbee: [fz.battery, fz.ias_wd, fz.ias_enroll, fz.ias_siren, ],
    toZigbee: [tz.warning, tz.warning_simple, tz.ias_max_duration, tz.squawk],
    configure: async (device, coordinatorEndpoint, logger) => {
        const endpoint = device.getEndpoint(1);
        await reporting.bind(endpoint, coordinatorEndpoint, ['genPowerCfg', 'ssIasZone', 'ssIasWd', 'genBasic']);
        await reporting.batteryPercentageRemaining(endpoint);
        await endpoint.read('ssIasZone', ['zoneState', 'iasCieAddr', 'zoneId', 'zoneStatus']);
        await endpoint.read('ssIasWd', ['maxDuration']);
    },
    exposes: [e.battery_low(), e.battery(), e.tamper(), e.squawk(), e.warning(), e.test(),
        exposes.numeric('max_duration', ea.ALL).withUnit('s').withValueMin(0).withValueMax(1800).withDescription('Max duration of the siren'),
        exposes.binary('alarm', ea.SET, 'ON', 'OFF').withDescription('Manual start of siren')],
};

module.exports = definition;