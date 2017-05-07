#!/usr/bin/env python




##################################################
## DEPENDENCIES
import sys
import os
import os.path
try:
    import builtins as builtin
except ImportError:
    import __builtin__ as builtin
from os.path import getmtime, exists
import time
import types
from Cheetah.Version import MinCompatibleVersion as RequiredCheetahVersion
from Cheetah.Version import MinCompatibleVersionTuple as RequiredCheetahVersionTuple
from Cheetah.Template import Template
from Cheetah.DummyTransaction import *
from Cheetah.NameMapper import NotFound, valueForName, valueFromSearchList, valueFromFrameOrSearchList
from Cheetah.CacheRegion import CacheRegion
import Cheetah.Filters as Filters
import Cheetah.ErrorCatchers as ErrorCatchers

##################################################
## MODULE CONSTANTS
VFFSL=valueFromFrameOrSearchList
VFSL=valueFromSearchList
VFN=valueForName
currentTime=time.time
__CHEETAH_version__ = '2.4.4'
__CHEETAH_versionTuple__ = (2, 4, 4, 'development', 0)
__CHEETAH_genTime__ = 1490984419.892704
__CHEETAH_genTimestamp__ = 'Fri Mar 31 15:20:19 2017'
__CHEETAH_src__ = '../m/solo.tmpl'
__CHEETAH_srcLastModified__ = 'Fri Mar 31 12:07:15 2017'
__CHEETAH_docstring__ = 'Autogenerated by Cheetah: The Python-Powered Template Engine'

if __CHEETAH_versionTuple__ < RequiredCheetahVersionTuple:
    raise AssertionError(
      'This template was compiled with Cheetah version'
      ' %s. Templates compiled before version %s must be recompiled.'%(
         __CHEETAH_version__, RequiredCheetahVersion))

##################################################
## CLASSES

class solo(Template):

    ##################################################
    ## CHEETAH GENERATED METHODS


    def __init__(self, *args, **KWs):

        super(solo, self).__init__(*args, **KWs)
        if not self._CHEETAH__instanceInitialized:
            cheetahKWArgs = {}
            allowedKWs = 'searchList namespaces filter filtersLib errorCatcher'.split()
            for k,v in KWs.items():
                if k in allowedKWs: cheetahKWArgs[k] = v
            self._initCheetahInstance(**cheetahKWArgs)
        

    def respond(self, trans=None):



        ## CHEETAH: main method generated for this template
        if (not trans and not self._CHEETAH__isBuffering and not callable(self.transaction)):
            trans = self.transaction # is None unless self.awake() was called
        if not trans:
            trans = DummyTransaction()
            _dummyTrans = True
        else: _dummyTrans = False
        write = trans.response().write
        SL = self._CHEETAH__searchList
        _filter = self._CHEETAH__currentFilter
        
        ########################################
        ## START - generated method body
        
        write(u"""#root = File.absolute_path(File.dirname(__FILE__))
#json_attribs root  + '/nodes/node.json'
#json_attribs nil
#lockfile nil

log_level     :""")
        _v = VFFSL(SL,"log.level",True) # u'${log.level}' on line 6, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${log.level}')) # from line 6, col 16.
        write(u'''
log_location  ''')
        _v = VFFSL(SL,"log.location",True) # u'${log.location}' on line 7, col 15
        if _v is not None: write(_filter(_v, rawExpr=u'${log.location}')) # from line 7, col 15.
        write(u'''

ssl_verify_mode    :verify_peer
rest_timeout ''')
        _v = VFFSL(SL,"timeout",True) # u'${timeout}' on line 10, col 14
        if _v is not None: write(_filter(_v, rawExpr=u'${timeout}')) # from line 10, col 14.
        write(u"""

node_name '""")
        _v = VFFSL(SL,"chef.node_name",True) # u'${chef.node_name}' on line 12, col 12
        if _v is not None: write(_filter(_v, rawExpr=u'${chef.node_name}')) # from line 12, col 12.
        write(u"""'

validation_client_name '""")
        _v = VFFSL(SL,"validation.client_name",True) # u'${validation.client_name}' on line 14, col 25
        if _v is not None: write(_filter(_v, rawExpr=u'${validation.client_name}')) # from line 14, col 25.
        write(u"""'
chef_server_url        'https://""")
        _v = VFFSL(SL,"chef.url",True) # u'${chef.url}' on line 15, col 33
        if _v is not None: write(_filter(_v, rawExpr=u'${chef.url}')) # from line 15, col 33.
        write(u''':''')
        _v = VFFSL(SL,"chef.port",True) # u'${chef.port}' on line 15, col 45
        if _v is not None: write(_filter(_v, rawExpr=u'${chef.port}')) # from line 15, col 45.
        write(u"""'
trusted_certs_dir      '""")
        _v = VFFSL(SL,"certs",True) # u'${certs}' on line 16, col 25
        if _v is not None: write(_filter(_v, rawExpr=u'${certs}')) # from line 16, col 25.
        write(u"""'
validation_key         '""")
        _v = VFFSL(SL,"etc",True) # u'${etc}' on line 17, col 25
        if _v is not None: write(_filter(_v, rawExpr=u'${etc}')) # from line 17, col 25.
        write(u'''/''')
        _v = VFFSL(SL,"validation.client_name",True) # u'${validation.client_name}' on line 17, col 32
        if _v is not None: write(_filter(_v, rawExpr=u'${validation.client_name}')) # from line 17, col 32.
        write(u""".pem'

syntax_check_cache_path  '/root/.chef/syntax_check_cache'
client_key               '""")
        _v = VFFSL(SL,"etc",True) # u'${etc}' on line 20, col 27
        if _v is not None: write(_filter(_v, rawExpr=u'${etc}')) # from line 20, col 27.
        write(u'''/admin.pem\'

#solo false

checksum_path "''')
        _v = VFFSL(SL,"var",True) # u'${var}' on line 24, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 24, col 16.
        write(u'''/checksums"

cookbook_path [
               \'''')
        _v = VFFSL(SL,"var",True) # u'${var}' on line 27, col 17
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 27, col 17.
        write(u"""/cookbooks',
               '""")
        _v = VFFSL(SL,"var",True) # u'${var}' on line 28, col 17
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 28, col 17.
        write(u'''/site-cookbooks\'
              ]

data_bag_path "''')
        _v = VFFSL(SL,"var",True) # u'${var}' on line 31, col 16
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 31, col 16.
        write(u'''/data_bags"

#environment "production"
environment_path \'''')
        _v = VFFSL(SL,"var",True) # u'${var}' on line 34, col 19
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 34, col 19.
        write(u"""/environments'
file_backup_path '""")
        _v = VFFSL(SL,"var",True) # u'${var}' on line 35, col 19
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 35, col 19.
        write(u"""/backup'
file_cache_path  '""")
        _v = VFFSL(SL,"var",True) # u'${var}' on line 36, col 19
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 36, col 19.
        write(u"""/cache'
role_path        '""")
        _v = VFFSL(SL,"var",True) # u'${var}' on line 37, col 19
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 37, col 19.
        write(u"""/roles'
json_attribs     '""")
        _v = VFFSL(SL,"var",True) # u'${var}' on line 38, col 19
        if _v is not None: write(_filter(_v, rawExpr=u'${var}')) # from line 38, col 19.
        write(u"""/node.json'

encrypted_data_bag_secret_key_path '""")
        _v = VFFSL(SL,"etc",True) # u'${etc}' on line 40, col 37
        if _v is not None: write(_filter(_v, rawExpr=u'${etc}')) # from line 40, col 37.
        write(u"""/encrypted_data_bag_secret'
""")
        
        ########################################
        ## END - generated method body
        
        return _dummyTrans and trans.response().getvalue() or ""
        
    ##################################################
    ## CHEETAH GENERATED ATTRIBUTES


    _CHEETAH__instanceInitialized = False

    _CHEETAH_version = __CHEETAH_version__

    _CHEETAH_versionTuple = __CHEETAH_versionTuple__

    _CHEETAH_genTime = __CHEETAH_genTime__

    _CHEETAH_genTimestamp = __CHEETAH_genTimestamp__

    _CHEETAH_src = __CHEETAH_src__

    _CHEETAH_srcLastModified = __CHEETAH_srcLastModified__

    _mainCheetahMethod_for_solo= 'respond'

## END CLASS DEFINITION

if not hasattr(solo, '_initCheetahAttributes'):
    templateAPIClass = getattr(solo, '_CHEETAH_templateClass', Template)
    templateAPIClass._addCheetahPlumbingCodeToClass(solo)


# CHEETAH was developed by Tavis Rudd and Mike Orr
# with code, advice and input from many other volunteers.
# For more information visit http://www.CheetahTemplate.org/

##################################################
## if run from command line:
if __name__ == '__main__':
    from Cheetah.TemplateCmdLineIface import CmdLineIface
    CmdLineIface(templateObj=solo()).run()


