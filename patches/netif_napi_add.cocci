@@
expression dev, napi, func, weight;
@@

+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,0,0) || RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9,2) || (RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(8,8) && RHEL_RELEASE_CODE < RHEL_RELEASE_VERSION(9,0))
netif_napi_add(dev, napi, func);
+#else /* LINUX_VERSION_CODE >= KERNEL_VERSION(6,0,0) || RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9,2) || (RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(8,8) && RHEL_RELEASE_CODE < RHEL_RELEASE_VERSION(9,0)) */
+netif_napi_add(dev, napi, func, NAPI_POLL_WEIGHT);
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(6,0,0) || RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(9,2) || (RHEL_RELEASE_CODE >= RHEL_RELEASE_VERSION(8,8) && RHEL_RELEASE_CODE < RHEL_RELEASE_VERSION(9,0)) */

+#if LINUX_VERSION_CODE < KERNEL_VERSION(4,5,0) && LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0)
+napi_hash_add(napi);
+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(4,5,0) && LINUX_VERSION_CODE >= KERNEL_VERSION(3,11,0) */


