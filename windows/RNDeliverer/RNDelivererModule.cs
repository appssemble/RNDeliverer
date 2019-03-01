using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Deliverer.RNDeliverer
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNDelivererModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNDelivererModule"/>.
        /// </summary>
        internal RNDelivererModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNDeliverer";
            }
        }
    }
}
