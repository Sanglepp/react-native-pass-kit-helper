export = PassKitHelper;
export as namespace PassKitHelper;

declare namespace PassKitHelper {
  /**
   * Use for disable apple pay
   * iOS Only
   * @param callback A callback function that will receive the result of the suppression.
   *                 - result: A number representing the result of the suppression.
   *                           0: Not Supported
   *                           1: Already suppressed
   *                           2: Denied
   *                           3: Cancelled
   *                           4: Success
   */
  export function suppressApplePay(callback: (result: number) => void): void;

  /**
   * Use for enable apple pay
   * iOS Only
   * @param callback A callback function that will receive the result of the enable pay.
   *                 - result: A number representing the result of the enable pay.
   *                           0: iOS lower than 9
   *                           1: Apple pay already presenting
   *                           2: Apple pay library not supported
   *                           3: Success
   */
  export function enableApplePay(callback: (result: number) => void): void;
}
